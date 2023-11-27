# List all commands in the menu

# Import modules
import os

# Define function
def main():
    # Print menu
    print("Menu:")
    print("1. Run")

    # Get user input
    choice = input("Enter your choice: ")

    # Run command
    if choice == "1":
        os.system("python3 $HOME/.local/share/Scripts/src/cmds/python/_run.py")
    else:
        print("Invalid choice")

# Run main function
if __name__ == "__main__":
    main()
