"""Recompute the numbers in examples/inventory/*.md from the fictional CSVs and compare them
with each example's front-matter `checked:` block. Usage: python3 -I scripts/check-examples.py"""
import csv
import datetime as dt
import math
import os
import sys

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
EX = os.path.join(ROOT, "examples", "inventory")
DATA = os.path.join(EX, "data")
WINDOW_END = dt.date(2026, 11, 26)  # last full day before the examples' date, 27 Nov 2026
WEEKS = 12


def rows(name):
    with open(os.path.join(DATA, name), newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def day(s):
    return dt.date.fromisoformat(s)


def front_matter(name):
    with open(os.path.join(EX, name), encoding="utf-8") as f:
        lines = f.read().split("\n")
    if lines[0] != "---":
        return {}
    out, inside = {}, False
    for line in lines[1:]:
        if line == "---":
            break
        if line.strip() == "checked:":
            inside = True
            continue
        if inside and line.startswith("  ") and ":" in line:
            k, v = line.strip().split(":", 1)
            out[k.strip()] = float(v)
    return out


def trail_sock():
    v, loc = "TRAIL-SOCK-M", "Main"
    start = WINDOW_END - dt.timedelta(days=7 * WEEKS - 1)
    sales = {}
    for r in rows("northpine-sales.csv"):
        if r["variant"] == v and r["location"] == loc and start <= day(r["date"]) <= WINDOW_END:
            sales[day(r["date"])] = sales.get(day(r["date"]), 0) + int(r["units"])
    stock = {day(r["date"]): r for r in rows("northpine-stock.csv") if r["variant"] == v and r["location"] == loc}
    censored, in_stock_units, in_stock_days, raw = 0, 0, 0, 0
    for w in range(WEEKS):
        days = [start + dt.timedelta(days=7 * w + i) for i in range(7)]
        out = [d for d in days if int(stock[d]["on_hand"]) <= 0 and stock[d]["continue_selling"] == "false"]
        units = sum(sales.get(d, 0) for d in days)
        raw += units
        if len(out) >= 3:
            censored += 1
        else:
            in_stock_units += units
            in_stock_days += 7
    rate_day = in_stock_units / in_stock_days
    pos = sorted((r for r in rows("northpine-pos.csv") if r["variant"] == v and r["status"] == "received"),
                 key=lambda r: r["received"])[-4:]
    lead = sum((day(r["received"]) - day(r["ordered"])).days for r in pos) / len(pos)
    on_hand = int(stock[WINDOW_END]["on_hand"])
    spare = int(next(r for r in rows("northpine-stock.csv")
                     if r["variant"] == v and r["location"] == "Riverside" and day(r["date"]) == WINDOW_END)["on_hand"])
    safety, cycle, pack = 30, 28, 12
    position = on_hand + spare
    rop = lead * rate_day + safety
    target = (lead + cycle) * rate_day + safety
    order = math.ceil((target - position) / pack) * pack
    return {
        "censored_weeks": censored,
        "in_stock_rate_week": rate_day * 7,
        "raw_rate_week": raw / WEEKS,
        "observed_lead_time_days": lead,
        "reorder_point": round(rop),
        "order_qty": order,
    }


def hoodie():
    nov = [r for r in rows("northpine-sales.csv")
           if r["variant"] == "HOODIE-CHARCOAL-L" and r["date"].startswith("2026-11")]
    wholesale = sum(int(r["units"]) for r in nov if r["customer_type"] == "wholesale")
    store = sum(int(r["units"]) for r in nov if r["customer_type"] != "wholesale")
    return {"wholesale_units": wholesale, "store_units": store}


def tote():
    v = "TOTE-SAND"
    on_hand = int(next(r for r in rows("northpine-stock.csv")
                       if r["variant"] == v and day(r["date"]) == WINDOW_END)["on_hand"])
    start = WINDOW_END - dt.timedelta(days=27)
    units = sum(int(r["units"]) for r in rows("northpine-sales.csv")
                if r["variant"] == v and start <= day(r["date"]) <= WINDOW_END)
    return {"on_hand": on_hand, "weeks_of_cover": on_hand / (units / 4)}


TOLERANCE = {"in_stock_rate_week": 0.5, "raw_rate_week": 0.5, "observed_lead_time_days": 1, "weeks_of_cover": 1}
CASES = {"reorder-trail-sock.md": trail_sock, "forecast-trust-hoodie.md": hoodie, "slow-stock-tote.md": tote}


def main():
    problems = []
    for name, compute in CASES.items():
        try:
            got = compute()
            want = front_matter(name)
        except (OSError, KeyError, StopIteration, ZeroDivisionError) as e:
            problems.append(f"{name}: could not compute ({type(e).__name__}: {e})")
            continue
        for key, value in got.items():
            if key not in want:
                problems.append(f"{name}: checked.{key} missing from front matter (computed {value:g})")
            elif abs(want[key] - value) > TOLERANCE.get(key, 0):
                problems.append(f"{name}: {key} expected {want[key]:g}, computed {value:g}")
    for p in problems:
        print(p)
    if problems:
        return 1
    print("examples: arithmetic ok")
    return 0


if __name__ == "__main__":
    sys.exit(main())
