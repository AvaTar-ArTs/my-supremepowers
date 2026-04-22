# Python Project Bootstrapping: Integrating Python Scripts with Gemini CLI

## 1. Introduction

Integrating Python scripts into the Gemini CLI workflow unlocks powerful automation and customization capabilities. In a "Factory Mode" context, where conciseness and direct execution are paramount, understanding how to leverage Python scripts within the CLI enhances productivity significantly. This section covers how to run Python scripts as commands, use them within custom skills, and manage data transfer.

## 2. Running Python Scripts as Commands

Python scripts can be executed directly from the Gemini CLI's terminal, provided they are made executable and their location is known (e.g., in your PATH or current directory).

### 2.1. Direct Execution

If your script is in the current directory and has execute permissions (e.g., `chmod +x my_script.py`):
```bash
./my_script.py --arg1 value1
```

If your script's directory is in your system's PATH, or if you've aliased it, you can run it by its name:
```bash
my_script --arg1 value1
```

### 2.2. Using `run_shell_command`

Within the Gemini CLI's agent interactions, the `run_shell_command` tool is used to execute shell commands, including Python scripts.

**Example:**
Imagine a Python script `process_data.py` that takes an input file path.

```python
# process_data.py
import sys
import json

def main():
    if len(sys.argv) > 1:
        input_file = sys.argv[1]
        print(f"Processing data from: {input_file}")
        # Simulate processing
        result = {"status": "processed", "input": input_file}
        print(json.dumps(result))
    else:
        print("Error: Input file path is required.")
        sys.exit(1)

if __name__ == "__main__":
    main()
```

To run this using `run_shell_command`:
```python
print(default_api.run_shell_command(command="python process_data.py my_data.csv"))
```
The output of the script will be captured and returned.

## 3. Using Python Scripts within Custom Gemini CLI Skills

Python scripts can be bundled as part of custom skills or executed by skills.

### 3.1. Bundling Scripts within a Skill

If a Python script is essential for a skill's operation, it can be included in the `scripts/` directory of the skill package. The `SKILL.md` file would then reference and call this script using `run_shell_command` or by importing it if the skill's execution environment allows.

**Example `SKILL.md` Snippet:**

```markdown
# My Python Skill

## Purpose
This skill automates data processing using a Python script.

## Core Workflow
1. User provides input parameters.
2. Skill calls `scripts/process_data.py` with parameters.
3. Script executes, logs results.
4. Skill returns processed information.

## Implementation Details
*   **Script:** `scripts/process_data.py` (details provided in the script itself)

## Execution
Use the following command to execute the script via the tool:
```python
print(default_api.run_shell_command(command="python scripts/process_data.py --input-file '''{{ .InputFile }}''' --config '''{{ .ConfigFile }}'''"))
```
Note: `{{ .InputFile }}` and `{{ .ConfigFile }}` are placeholders that would be filled by the skill's templating engine.
```

### 3.2. Calling External Python Scripts

A skill can also call external Python scripts that are already installed on the system or in the environment. The same `run_shell_command` tool is used, ensuring the script's path is accessible.

## 4. Passing Data Between Gemini CLI and Python Scripts

Effective data transfer is key for integration.

### 4.1. Command-Line Arguments

As shown in Section 3.2, Python scripts can accept arguments directly via `sys.argv` or `argparse`. Gemini CLI's `run_shell_command` tool passes these arguments directly.

### 4.2. Standard Input/Output (stdin/stdout)

For more complex data, scripts can read from stdin and write to stdout.

**Python Script (reading JSON from stdin):**
```python
import sys
import json

def main():
    try:
        data_str = sys.stdin.read()
        data = json.loads(data_str)
        print(f"Received data: {data}")
        # Process data...
        result = {"success": True, "processed_data": data}
        print(json.dumps(result))
    except json.JSONDecodeError:
        print("Error: Invalid JSON input.", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"An error occurred: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
```

**Gemini CLI `run_shell_command` (piping JSON):**
```python
import json

payload_data = {"key": "value", "number": 123}
json_payload = json.dumps(payload_data)

# Note: Piping complex data often requires careful quoting and shell escaping.
# The exact implementation might vary based on shell and command complexity.
# A common pattern is to pass JSON as a string argument or via stdin.

# Example piping via stdin (may need shell escaping for complex data):
print(default_api.run_shell_command(command="echo '''" + json_payload + "''' | python process_stdin.py"))
```

### 4.3. Environment Variables

Pass configuration or context via environment variables, especially for sensitive information like API keys or file paths.

```python
import os

project_dir = os.environ.get("PROJECT_DIRECTORY")
api_endpoint = os.environ.get("API_ENDPOINT", "https://default.api.com")

if not project_dir:
    print("Error: PROJECT_DIRECTORY environment variable not set.")
    sys.exit(1)

# ... script logic using project_dir and api_endpoint
```
Gemini CLI's `run_shell_command` does not directly support setting environment variables within its parameters. However, you can set them in the shell before executing the command if running interactively, or manage them through CI/CD pipelines or other orchestration.

## 5. Conclusion

Integrating Python scripts with the Gemini CLI provides a powerful way to automate tasks, extend functionality, and build robust workflows. By following these patterns for script execution, argument handling, logging, configuration, and data transfer, you can create powerful, reusable components that fit seamlessly into the Gemini CLI's operational model.
