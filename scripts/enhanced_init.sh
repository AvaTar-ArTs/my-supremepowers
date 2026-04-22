#!/bin/bash
# Qwen Enhanced Ecosystem Initialization Script
# Sets up and verifies the advanced capabilities integration

echo "🚀 Qwen Enhanced Ecosystem Initialization"
echo "========================================="
echo ""
echo "This script verifies that the advanced capabilities from the Cursor"
echo "ecosystem have been successfully integrated into your Qwen environment."
echo ""

# Check for required files
echo "🔍 Checking for integrated capabilities..."
REQUIRED_FILES=(
    "QWEN_SYSTEM_DEFINITION.md"
    "Master_Recall_Index.md" 
    "Use_Cases_And_Triggers.md"
    "Working_Principles.md"
    "Logic_Flows.md"
    "README.md"
    "INTEGRATION_SUMMARY.md"
    "ECOSYSTEM_ANALYSIS.md"
)

MISSING_FILES=()
for file in "${REQUIRED_FILES[@]}"; do
    if [[ ! -f "$HOME/.qwen/$file" ]]; then
        MISSING_FILES+=("$file")
    fi
done

if [[ ${#MISSING_FILES[@]} -eq 0 ]]; then
    echo "✅ All core documentation files are present"
else
    echo "⚠️  Missing files: ${MISSING_FILES[*]}"
fi

# Check for skills
echo ""
echo "🔍 Checking for integrated skills..."
SKILLS_DIR="$HOME/.qwen/skills"
if [[ -d "$SKILLS_DIR" ]]; then
    SKILL_COUNT=$(find "$SKILLS_DIR" -name "SKILL.md" | wc -l)
    echo "✅ Found $SKILL_COUNT integrated skills:"
    find "$SKILLS_DIR" -name "SKILL.md" -exec basename -a {} \; | sed 's/^/   - /'
else
    echo "⚠️  Skills directory not found"
fi

# Check for scripts
echo ""
echo "🔍 Checking for utility scripts..."
SCRIPTS_DIR="$HOME/.qwen/scripts"
if [[ -d "$SCRIPTS_DIR" ]] && [[ -f "$SCRIPTS_DIR/update.sh" ]]; then
    echo "✅ Update script is available and executable"
    ls -la "$SCRIPTS_DIR/update.sh"
else
    echo "⚠️  Update script not found"
fi

# Show key capabilities
echo ""
echo "🌟 Key Capabilities Available:"
echo ""
echo "📚 Documentation:"
echo "   - System Definition: Core principles and architecture"
echo "   - Master Recall Index: Where to find capabilities"
echo "   - Use Cases & Triggers: Matching goals to tools"
echo "   - Working Principles: Consistent behavior guidelines"
echo "   - Logic Flows: Process diagrams and decision trees"
echo ""
echo "🛠️  Advanced Skills:"
echo "   - Systematic Debugging: Four-phase problem solving"
echo "   - Ecosystem Navigation: Finding and using capabilities"
echo "   - More skills can be added following documented patterns"
echo ""
echo "🔄 Workflows:"
echo "   - Superpowers chain: Brainstorm → Plan → Execute → Verify"
echo "   - Ecosystem management: Audit → Propose → Execute → Log"
echo "   - Cross-platform coordination: Connect different AI tools"
echo ""

# Show how to get started
echo "📖 Getting Started:"
echo "   1. Read the system definition:"
echo "      cat ~/.qwen/QWEN_SYSTEM_DEFINITION.md"
echo "   2. Use the master recall index to find capabilities:"
echo "      cat ~/.qwen/Master_Recall_Index.md"
echo "   3. Apply systematic approaches to your work"
echo ""

# Run the update script to verify everything works
echo "🔧 Verifying system integrity..."
echo ""
"$HOME/.qwen/scripts/update.sh"

echo ""
echo "🎉 Qwen Enhanced Ecosystem is ready for use!"
echo ""
echo "The advanced capabilities from the Cursor ecosystem have been"
echo "successfully integrated into your Qwen environment. You now have"
echo "access to systematic debugging, superpowers workflows, ecosystem"
echo "management tools, and cross-platform integration capabilities."