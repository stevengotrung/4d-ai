# Implementing an approved improvement

1. Recover approved behavior and acceptance criteria. Check subsequent feedback, repository instructions, and working-tree state.
2. Inspect relevant code and checks. Confirm the cause or record remaining uncertainty. Preserve unrelated work. Identify other screens, jobs, endpoints, or clients consuming changed shared code, styles, or contracts, and plan regression checks for affected consumers.
3. Implement within scope, following project conventions. Avoid unrelated cleanup or configuration changes.
4. Verify affected behavior, regressions, and meaningful edge cases using the guidance below. Where practical, demonstrate a bug regression check fails before and passes after. Run required project checks and appropriate direct UI validation. Do not add tests merely matching implementation wording.
5. Record commands, outcomes, environment, and limitations. Distinguish new and pre-existing failures only with evidence. Do not weaken tests to make a result pass.
6. Prepare or create the authorized PR/MR with the problem, approved behavior, change, evidence link, verification, and impact follow-up. Follow the project template and disclose unresolved limitations.

If access or environment blocks a check, complete independent work and report what remains. Do not claim an inspected patch was executed. Merge, deployment, and external messages follow existing user authorization and project rules.

## Verify the environment before trusting results

Before each verification pass that depends on a running environment, establish that its served build corresponds to the intended revision and configuration. Use a build identifier, deployment metadata, artifact hash, or another reliable observable check; a local Git HEAD alone does not establish what the server serves. Recheck after rebuilds, deployments, or environment changes. Record the evidence. If the environment is stale or cannot be identified, do not count its results as verification of the intended revision; resolve it or report the limitation.

## Test the journey, not just the script

Approach the affected task as a new user without relying on hidden setup or knowledge from implementation. Cover relevant entry points, first-use/empty states, and returning-user or already-completed states. Include meaningful retry, error, and recovery paths. Scope this exploration to the change and its risks, rather than requiring every control in the whole product to be tested.

Compare against approved designs and the original user problem as well as acceptance criteria. Specifications, tests, and implementation can share the same mistaken assumption. For higher-risk changes, recommend an independent reviewer or fresh-context verification when available and authorized. Different models are optional; independence of evidence and execution matters more than agent names. Report when independent review was not performed.

Run explicit “still works” checks for affected shared consumers. Record what was checked and justify representative sampling when exhaustive coverage is impractical. Document untested consumers rather than implying universal coverage.

## State verification coverage honestly

Identify needed credentials and tools before the relevant run. If the primary way users interact with the feature cannot be exercised, raise that blocker promptly and report partial verification. Passing unit tests or an alternate entry path does not substitute for the untested primary interaction. Continue independent checks and provide a precise handoff; do not silently mark the missing path as passed or declare the feature verified.

## Keep supporting material and resources current

When user-visible behavior changes, inspect relevant help, onboarding, documentation, and AI-assistant knowledge. Update affected material within authorized scope. For separately owned or inaccessible material, record the required update and owner; do not silently claim the rollout is complete. Do not create a knowledge base where none exists.

Release reserved shared test environments or locks while waiting for a human decision when they are no longer needed. Save reproducible setup and evidence first, follow the environment's reservation policy, and release only resources owned by this task. On resumption, reacquire and revalidate the environment. Do not terminate another team's work or discard necessary state blindly.
