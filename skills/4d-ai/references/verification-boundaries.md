# Verification at an engineering handoff

Keep domain testing with the engineering workflow. Check these concrete failure modes when they affect the claim being handed back:

- Identify the revision/build actually served by the test environment before trusting a result. A successful rebuild command alone does not establish the served version.
- Identify consumers of changed shared code. Include relevant still-works checks; a passing target page does not verify other pages.
- Exercise the primary user journey and relevant first-use, repeat-use and failure states. The authored acceptance script may share the implementation's blind spots. Use independent review when consequences justify it.
- Compare against approved behavior/design. Record material deviation for a decision before expanding scope; a rationale note alone is not approval.
- Distinguish passed, failed and untested checks. Missing credentials or tools can block primary-path verification while other work continues.
- Keep help content and applicable knowledge resources consistent with changed behavior within scope. Hand off remaining documentation explicitly.

Provide evidence references and limitations rather than forwarding a generic “QA passed.” Never manufacture commit IDs, screenshots or results. Source queries should be scoped, read-only and minimal; avoid copying personal information. Link UI recordings at relevant timestamps when available and use appropriate visual evidence for UI claims.
