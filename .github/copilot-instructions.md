# Copilot Instructions for Dutch Tutor

## High-Level Architecture

This project is a modular, markdown-based Dutch language tutor, focused on personalized, Duolingo-aligned learning. The core logic and behavior are defined in agent markdown files (e.g., `agents/dutch-tutor.agent.md`). Skills extend the agent's capabilities for Duolingo topic sync, error tracking, and personalized practice. There is no executable code or build system; all logic is declarative and agent-driven.

## Key Conventions

- Agents are defined in `.agent.md` files in the `agents/` directory.
- Each agent file starts with a YAML frontmatter block specifying name, role, language, persona, and description.
- Agent behavior is described in natural language rules within the markdown file, with a focus on Duolingo integration and personalized feedback.
- Skills are markdown files in the `skills/` directory, each with a clear role (e.g., Duolingo sync, error tracking, personalized practice).
- No JavaScript, Node.js, or other runtime code is present or required.

## Project Structure

- `agents/` — Contains agent markdown files defining conversational logic and rules.
- `skills/` — (Optional) For modular skill markdown files to extend agent capabilities.
- `.github/copilot-instructions.md` — This file, to guide Copilot and future contributors.

## Contribution

- Extend or modify agent behavior by editing the relevant `.agent.md` file.
- Add new skills as markdown files in the `skills/` directory if needed.
- No build, test, or lint steps are required.

---

This file summarizes the architecture and conventions for this markdown-based agent project. If you want to adjust or add coverage for other areas, let me know!