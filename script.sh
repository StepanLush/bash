#!/bin/bash

USER_NAME=$(whoami)
TASK_DIR="/home/$USER_NAME/task/demo"

#Step 1
echo "Creating dir: $TASK_DIR..."
mkdir -p "$TASK_DIR"

#Step 2
echo "Creating files test123, test456, test789, test_final.json"
touch "$TASK_DIR/test123" "$TASK_DIR/test456" "$TASK_DIR/test789" "$TASK_DIR/test_final.json"

#Step 3
echo "Writing test_final.json..."
cat > "$TASK_DIR/test_final.json" <<EOL
{
  "row1": "test123",
  "row2": "test456",
  "row3": "test789"
}
EOL

#Step 4
echo "Files created"
read -p "Do you want to continue? (yes/no): " response
if [[ "$response" != "yes" ]]; then
    echo "Script completed"
    exit 1
fi

#Step 5
echo "Updating test_fial.json"
cat > "$TASK_DIR/test_final.json" <<EOL
{
  "row1": "test321",
  "row2": "test654",
  "row3": "test987"
}
EOL

#Step 6
echo "test_final.json:"
cat "$TASK_DIR/test_final.json"

echo "Script completed"