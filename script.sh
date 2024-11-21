#!/bin/bash

USER_NAME=$(whoami)
TASK_DIR="/home/$USER_NAME/task/demo"
FILES_NUMBER=3

#Step 1
echo "Creating dir: $TASK_DIR..."
mkdir -p "$TASK_DIR"

#Step 2
echo "Creating files test1, test2, test3, test_final.json"
for (( i = 1; i < $FILES_NUMBER+1; i++ ))
do 
  RANDOM_LETTERS=$(tr -dc 'a-zA-Z' < /dev/urandom | head -c 3) 
  touch "$TASK_DIR/test$i-$RANDOM_LETTERS"
done

#Step 3
echo "Writing test_final.json..."
cat > "$TASK_DIR/test_final.json" <<EOL 
{ 
EOL
for ((i = 1; i < $FILES_NUMBER+1; i++ ))
do
  echo "  "row$i": "test$i-xxx"" >> $TASK_DIR/test_final.json
done
echo "}" >> $TASK_DIR/test_final.json

#Step 4
echo "test_final.json:"
cat "$TASK_DIR/test_final.json"

#Step 5
echo "Files created"
read -p "Do you want to continue? (yes/no): " response
if [[ "$response" != "yes" ]]; then
    echo "Script completed"
    rm -r $TASK_DIR
    exit 1
fi

#Step 6
echo "Updating test_fial.json"
cat > "$TASK_DIR/test_final.json" <<EOL 
{
EOL
for ((i = 1; i < $FILES_NUMBER+1; i++ ))
do
  echo "  "row$i": "test$i-$(ls $TASK_DIR/test$i* | tail -c 4)"" >> $TASK_DIR/test_final.json
done
echo "}" >> $TASK_DIR/test_final.json

#Step 7
echo "test_final.json:"
cat "$TASK_DIR/test_final.json"

echo "Script completed"
#rm -r $TASK_DIR