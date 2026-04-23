# qwen_projects JSON + Chat Style Analysis

Generated: 2026-04-22T20:33:05.400445

## JSON Schema Profile
- Dominant object key-sets (top 5):
  - `('cwd', 'parentUuid', 'sessionId', 'subtype', 'systemPayload', 'timestamp', 'type', 'uuid', 'version')` -> 15940
  - `('cwd', 'gitBranch', 'parentUuid', 'sessionId', 'subtype', 'systemPayload', 'timestamp', 'type', 'uuid', 'version')` -> 11692
  - `('cwd', 'message', 'parentUuid', 'sessionId', 'timestamp', 'toolCallResult', 'type', 'uuid', 'version')` -> 4465
  - `('cwd', 'message', 'model', 'parentUuid', 'sessionId', 'timestamp', 'type', 'usageMetadata', 'uuid', 'version')` -> 3194
  - `('cwd', 'gitBranch', 'message', 'parentUuid', 'sessionId', 'timestamp', 'toolCallResult', 'type', 'uuid', 'version')` -> 3189
- Missing-key counts across parsed events:
  - `message` missing in 27632 events

## Global Event Mix
- `system`: 27632 (62.6%)
- `tool_result`: 7654 (17.3%)
- `assistant`: 7592 (17.2%)
- `user`: 1256 (2.8%)

## Transition Patterns (type -> type)
- `system -> system`: 74
- `system -> assistant`: 17
- `assistant -> system`: 12
- `system -> tool_result`: 12
- `tool_result -> tool_result`: 12
- `tool_result -> system`: 12
- `user -> system`: 5
- `assistant -> user`: 3
- `system -> user`: 1

## Per-Project Style Fingerprints (Top 20 by events)
### -Users-steven
- sessions=33 events=10929 parse_errors=0
- avg lengths: user=1183.8 chars, assistant=375.6 chars
- style markers: directive_openers=47, path_heavy_user_msgs=118, assistant_planning_language=1525, assistant_code_blocks=62
- top tools: run_shell_command:976, read_file:238, list_directory:206, write_file:205, todo_write:122, edit:91
- type mix: {'system': 6538, 'user': 326, 'assistant': 2109, 'tool_result': 1956}

### -Users-steven-Music-nocTurneMeLoDieS
- sessions=10 events=5960 parse_errors=0
- avg lengths: user=1421.7 chars, assistant=472.0 chars
- style markers: directive_openers=15, path_heavy_user_msgs=59, assistant_planning_language=565, assistant_code_blocks=22
- top tools: run_shell_command:519, write_file:319, read_file:180, edit:21, skill:18, agent:17
- type mix: {'user': 145, 'system': 3980, 'tool_result': 1124, 'assistant': 711}

### -Users-steven-pythons
- sessions=6 events=5757 parse_errors=0
- avg lengths: user=1787.8 chars, assistant=659.9 chars
- style markers: directive_openers=12, path_heavy_user_msgs=80, assistant_planning_language=625, assistant_code_blocks=45
- top tools: run_shell_command:366, read_file:153, agent:66, write_file:37, edit:21, skill:20
- type mix: {'system': 4152, 'user': 157, 'assistant': 718, 'tool_result': 730}

### -Users-steven-workspace
- sessions=1 events=1929 parse_errors=0
- avg lengths: user=2905.3 chars, assistant=254.5 chars
- style markers: directive_openers=3, path_heavy_user_msgs=17, assistant_planning_language=109, assistant_code_blocks=1
- top tools: run_shell_command:79, task:29, list_directory:8, todo_write:6, write_file:3, glob:2
- type mix: {'system': 1632, 'user': 25, 'assistant': 144, 'tool_result': 128}

### -Users-steven-scripts
- sessions=4 events=1906 parse_errors=0
- avg lengths: user=5319.6 chars, assistant=496.5 chars
- style markers: directive_openers=16, path_heavy_user_msgs=28, assistant_planning_language=299, assistant_code_blocks=1
- top tools: run_shell_command:152, read_file:90, todo_write:49, write_file:25, agent:12, list_directory:9
- type mix: {'system': 1136, 'user': 52, 'assistant': 360, 'tool_result': 358}

### -Users-steven-iterm2
- sessions=6 events=1694 parse_errors=0
- avg lengths: user=78.2 chars, assistant=813.2 chars
- style markers: directive_openers=4, path_heavy_user_msgs=18, assistant_planning_language=287, assistant_code_blocks=10
- top tools: run_shell_command:178, write_file:75, read_file:44, todo_write:17, list_directory:10, edit:7
- type mix: {'user': 50, 'system': 919, 'assistant': 385, 'tool_result': 340}

### -Users-steven-MasterxEo
- sessions=2 events=1545 parse_errors=0
- avg lengths: user=1931.9 chars, assistant=514.8 chars
- style markers: directive_openers=3, path_heavy_user_msgs=22, assistant_planning_language=234, assistant_code_blocks=6
- top tools: run_shell_command:104, list_directory:58, read_file:47, todo_write:33, task:7, write_file:5
- type mix: {'system': 953, 'user': 39, 'assistant': 295, 'tool_result': 258}

### -Users-steven-NotebookLM
- sessions=2 events=1507 parse_errors=0
- avg lengths: user=1243.7 chars, assistant=456.2 chars
- style markers: directive_openers=4, path_heavy_user_msgs=25, assistant_planning_language=209, assistant_code_blocks=5
- top tools: run_shell_command:91, read_file:70, edit:19, write_file:19, skill:18, glob:14
- type mix: {'user': 55, 'system': 922, 'assistant': 266, 'tool_result': 264}

### -Users-steven-ice-tracker
- sessions=1 events=1447 parse_errors=0
- avg lengths: user=519.8 chars, assistant=330.6 chars
- style markers: directive_openers=9, path_heavy_user_msgs=19, assistant_planning_language=318, assistant_code_blocks=6
- top tools: run_shell_command:303, write_file:13, todo_write:5, read_file:1, list_directory:1
- type mix: {'user': 50, 'system': 706, 'assistant': 368, 'tool_result': 323}

### -Users-steven-p-market
- sessions=1 events=1310 parse_errors=0
- avg lengths: user=420.8 chars, assistant=510.3 chars
- style markers: directive_openers=2, path_heavy_user_msgs=5, assistant_planning_language=86, assistant_code_blocks=2
- top tools: read_file:61, write_file:48, run_shell_command:45, glob:21, todo_write:10, agent:7
- type mix: {'user': 23, 'system': 957, 'assistant': 127, 'tool_result': 203}

### -Users-steven--cursor
- sessions=3 events=1308 parse_errors=0
- avg lengths: user=367.2 chars, assistant=866.6 chars
- style markers: directive_openers=8, path_heavy_user_msgs=21, assistant_planning_language=286, assistant_code_blocks=11
- top tools: run_shell_command:202, read_file:28, write_file:18, list_directory:17, todo_write:14, grep_search:2
- type mix: {'system': 642, 'user': 48, 'assistant': 332, 'tool_result': 286}

### -Users-steven-github-GPTJunkie-github-io
- sessions=1 events=1274 parse_errors=0
- avg lengths: user=205.4 chars, assistant=400.6 chars
- style markers: directive_openers=2, path_heavy_user_msgs=8, assistant_planning_language=109, assistant_code_blocks=6
- top tools: run_shell_command:55, skill:20, read_file:19, ask_user_question:14, agent:14, todo_write:11
- type mix: {'user': 30, 'system': 926, 'assistant': 164, 'tool_result': 154}

### -Users-steven-Downloads
- sessions=1 events=1196 parse_errors=0
- avg lengths: user=366.6 chars, assistant=357.3 chars
- style markers: directive_openers=2, path_heavy_user_msgs=13, assistant_planning_language=225, assistant_code_blocks=4
- top tools: run_shell_command:220, write_file:39, task:3, list_directory:1, read_file:1
- type mix: {'user': 24, 'system': 666, 'tool_result': 264, 'assistant': 242}

### -Users-steven-ice-tracker-v7
- sessions=1 events=1133 parse_errors=0
- avg lengths: user=191.9 chars, assistant=505.1 chars
- style markers: directive_openers=3, path_heavy_user_msgs=16, assistant_planning_language=238, assistant_code_blocks=4
- top tools: run_shell_command:114, write_file:87, todo_write:16, read_file:13, web_search:7, list_directory:4
- type mix: {'user': 40, 'system': 556, 'assistant': 286, 'tool_result': 251}

### -Users-steven-ice-tracker-v7-backend-src-modules-data-ingestion
- sessions=1 events=1055 parse_errors=0
- avg lengths: user=1657.4 chars, assistant=390.4 chars
- style markers: directive_openers=7, path_heavy_user_msgs=29, assistant_planning_language=207, assistant_code_blocks=16
- top tools: run_shell_command:152, edit:45, read_file:16, write_file:10, list_directory:2
- type mix: {'user': 48, 'system': 509, 'assistant': 273, 'tool_result': 225}

### -Users-steven-iterm2-claude-ecosystem--claude-projects
- sessions=1 events=1008 parse_errors=0
- avg lengths: user=3297.6 chars, assistant=281.1 chars
- style markers: directive_openers=2, path_heavy_user_msgs=24, assistant_planning_language=226, assistant_code_blocks=18
- top tools: run_shell_command:131, write_file:56, list_directory:25, edit:5, task:1
- type mix: {'user': 36, 'system': 504, 'assistant': 250, 'tool_result': 218}

### -Users-steven-PYTHON-MARKETPLACE-MASTER
- sessions=1 events=859 parse_errors=0
- avg lengths: user=2263.8 chars, assistant=388.2 chars
- style markers: directive_openers=2, path_heavy_user_msgs=7, assistant_planning_language=104, assistant_code_blocks=1
- top tools: run_shell_command:68, write_file:20, read_file:18, agent:11, todo_write:6, list_directory:4
- type mix: {'user': 20, 'system': 579, 'assistant': 127, 'tool_result': 133}

### -Users-steven-iterm2--qwen-superpowers
- sessions=1 events=530 parse_errors=0
- avg lengths: user=557.8 chars, assistant=222.1 chars
- style markers: directive_openers=1, path_heavy_user_msgs=4, assistant_planning_language=70, assistant_code_blocks=1
- top tools: read_file:63, list_directory:43, todo_write:13, glob:7, grep_search:3
- type mix: {'user': 5, 'system': 263, 'assistant': 133, 'tool_result': 129}

### -Volumes-Bin
- sessions=1 events=461 parse_errors=0
- avg lengths: user=222.7 chars, assistant=441.1 chars
- style markers: directive_openers=1, path_heavy_user_msgs=12, assistant_planning_language=74, assistant_code_blocks=4
- top tools: run_shell_command:68, read_file:12, edit:8, ask_user_question:4, write_file:3, agent:2
- type mix: {'user': 20, 'system': 246, 'assistant': 98, 'tool_result': 97}

### -Volumes-SiTed
- sessions=2 events=424 parse_errors=0
- avg lengths: user=247.7 chars, assistant=339.1 chars
- style markers: directive_openers=3, path_heavy_user_msgs=12, assistant_planning_language=52, assistant_code_blocks=4
- top tools: run_shell_command:70, write_file:4, agent:4, edit:4, pkill:1
- type mix: {'user': 18, 'system': 232, 'assistant': 91, 'tool_result': 83}

## Interpretation
- Overall interaction style is operations-heavy and tool-mediated, with many `system` and `tool_result` records relative to plain conversational turns.
- User prompts are directive and path-oriented in high-volume projects, indicating orchestration workflows rather than freeform chat.
- Assistant language frequently includes planning markers, suggesting iterative execution loops (plan -> run tool -> report -> continue).
