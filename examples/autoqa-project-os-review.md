# Example: Project OS Review for an Agent-Friendly AutoQA Tool

This is a fictional example showing how Project OS Skills can structure a project idea.

## 1. Product positioning

One-sentence definition:

> AutoQA is a lightweight automated website testing tool designed for AI agents and developers.

Target user:

- solo developers
- small teams
- AI coding agents
- interns or engineers who need fast website QA reports

Core problem:

Existing testing tools are powerful but often too heavy for quick agent-driven website audits. Users want to say: “test this website and generate a report,” then receive a useful Markdown report.

## 2. Target users and JTBD

### Developer using an agent

When I ask an agent to test a website,

I want the agent to run structured checks with a standard tool,

So that I can get a reliable report instead of vague manual observations.

### Small team before release

When we are about to release a website,

I want a lightweight smoke and regression test,

So that we catch broken links, auth issues, SEO problems, and obvious UI failures.

## 3. Core workflow

```text
Target URL + optional test account
  -> crawl / route discovery
  -> browser automation
  -> API / SEO / accessibility / visual checks
  -> screenshots and logs
  -> Markdown report
  -> regression cases
```

## 4. Moat analysis

Public capabilities:

- Playwright
- Lighthouse
- curl
- browser screenshots
- common accessibility checks

Hidden know-how:

- agent-friendly test planning
- standard website QA checklist
- report structure
- auth/session handling
- failure classification
- regression memory

Integration moat:

- one command or agent instruction
- browser automation + SEO + API checks + report generation
- reusable test account configuration

Operational moat:

- simple installation
- reproducible reports
- safe defaults
- easy CI integration later

## 5. ADR candidates

- ADR-001: TypeScript as orchestration layer because Playwright ecosystem is strongest.
- ADR-002: Python for optional report analysis and AI-assisted summarization.
- ADR-003: Go for future single-binary runner if installation friction becomes critical.
- ADR-004: Markdown as first-class report output.

## 6. Security and permissions

Sensitive fields:

- test account password
- cookies
- tokens
- screenshots of private pages
- internal error traces

Public report should redact:

- passwords
- Authorization headers
- session cookies
- private tokens

## 7. QA checklist

Critical checks:

- target reachable
- login works
- protected pages require auth
- robots.txt and sitemap.xml valid where expected
- key pages return correct status
- console errors captured
- broken links captured
- screenshots saved
- report generated

## 8. Next actions

1. Write ADRs for language/runtime choices.
2. Define report schema.
3. Implement a minimal Playwright runner.
4. Add redaction rules.
5. Add example reports.
