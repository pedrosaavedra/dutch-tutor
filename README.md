# Dutch Tutor Agent

A modular, markdown-based Dutch language tutor with Duolingo expertise, focused on personalized, topic-aligned learning for each user.

## Features
- **Duolingo-Aware:** Syncs or references your current Duolingo lesson/topic for seamless learning alignment.
- **Personalized Error Tracking:** Logs your mistakes, identifies weak areas, and generates targeted practice.
- **Modular Skills:** Easily extensible skills for Duolingo topic sync, error tracking, and personalized practice.
- **Custom Practice Generation:** Combines your Duolingo progress and error patterns to create tailored exercises.

## Skills Overview
- `skills/duolingo_sync.skill.md`: Syncs with or references your Duolingo lesson/topic.
- `skills/error_tracking.skill.md`: Tracks and analyzes your errors for focused practice.
- `skills/personalized_practice.skill.md`: Generates custom exercises based on your progress and errors.

## Getting Started
1. Clone this repository.
2. All logic is defined in markdown agent and skill files—no code or build steps required.
3. Extend or add new skills in the `skills/` directory as needed.

## Example Usage
- Interact with the agent defined in `agents/dutch-tutor.agent.md`.
- The agent will reference your Duolingo topic, track your errors, and generate personalized practice.

## Contributing
Feel free to open issues or submit pull requests to add new skills or improve the agent.

## License
MIT
