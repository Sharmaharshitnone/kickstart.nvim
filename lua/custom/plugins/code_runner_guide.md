# Using code_runner.nvim

This plugin allows you to run code directly from Neovim with a single keystroke. Here's how to use it:

## Basic Usage

1. **Run the current file**:

   - Press `<leader>rf` to run the current file
   - The output will appear in a floating window by default

2. **Run a project**:

   - Press `<leader>rp` to run the current project
   - This will detect project-specific files like `package.json`, `Cargo.toml`, etc.

3. **Close the runner window**:
   - Press `<leader>rc` to close the running terminal window

## Keybindings

| Keybinding    | Description                         |
| ------------- | ----------------------------------- |
| `<leader>r`   | Run code (general)                  |
| `<leader>rf`  | Run current file                    |
| `<leader>rp`  | Run project                         |
| `<leader>rc`  | Close runner window                 |
| `<leader>crf` | Custom command for current filetype |
| `<leader>crp` | Custom command for current project  |

## Supported Languages

The plugin is configured to work with:

- **Python**: `python3 -u $fileName`
- **JavaScript**: `node $fileName`
- **TypeScript**: `ts-node $fileName`
- **Rust**: `cargo run`
- **Go**: `go run $fileName`
- **C++**: `g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt`
- **C**: `gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt`
- **Java**: `cd $dir && javac $fileName && java $fileNameWithoutExt`
- **Shell**: `bash $fileName`
- **Lua**: `lua $fileName`
- **PHP**: `php $fileName`
- **Ruby**: `ruby $fileName`
- **Perl**: `perl $fileName`
- **R**: `Rscript $fileName`
- **Dart**: `dart $fileName`
- **Julia**: `julia $fileName`
- **Kotlin**: `kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar`
- **Swift**: `swift $fileName`
- **Haskell**: `runhaskell $fileName`
- **Lisp**: `clisp $fileName`
- **Elixir**: `elixir $fileName`
- **MATLAB**: `matlab -nodisplay -nosplash -nodesktop -r "run('$fileName');exit;"`

## Project Support

The plugin will automatically detect projects based on common project files:

- **Node.js projects**: Detected by `package.json`
- **Rust projects**: Detected by `Cargo.toml`
- **Java Maven projects**: Detected by `pom.xml`
- **Make projects**: Detected by `Makefile`
- **Go projects**: Detected by `go.mod`

## Customizing Commands

You can customize commands for specific file types:

1. Open the configuration file: `lua/custom/plugins/code_runner.lua`
2. Modify the `filetype` table with your preferred commands
3. Use these variables in your commands:
   - `$fileName`: The complete file name
   - `$fileNameWithoutExt`: The file name without extension
   - `$dir`: The directory of the current file

## UI Modes

You can change the UI mode by modifying the `mode` option in the configuration:

- `float`: Shows output in a floating window
- `term`: Shows output in a terminal split
- `tab`: Opens output in a new tab
- `toggle`: Toggles between showing/hiding the output
- `buf`: Shows output in a buffer

## Example Usage Workflow

1. Create a Python file: `example.py`
2. Write some Python code
3. Save the file
4. Press `<leader>rf` to run it
5. See the output in the floating window
6. Press `<leader>rc` to close the window when done

For project-based codebases, navigate to the project root and press `<leader>rp` to run the project using the appropriate build tool.

## Troubleshooting

If you encounter issues:

1. Make sure the required interpreters/compilers are installed:

   - For Python files: `python3` needs to be installed
   - For JavaScript: `node` needs to be installed
   - For TypeScript: `ts-node` needs to be installed
   - For other languages, install their respective compilers/interpreters

2. If keybindings don't work:

   - Check if there are conflicting keybindings
   - Try using the commands directly: `:RunCode`, `:RunFile`, etc.

3. If the output doesn't show:
   - Try changing the mode in the configuration from `float` to `term` or `tab`

## Additional Tips

- For supported languages, files are automatically saved before running when using `<leader>r` or `<leader>rf`
- You can run specific sections of code by visually selecting them (not supported for all languages)
- Use `<leader>crf` to see all supported filetypes and their commands
- When working with large projects, `<leader>rp` is often more useful than `<leader>rf`

## Advanced Features

### Auto-save Before Running

The plugin is configured to automatically save your file before running it for supported languages. This ensures that the latest changes are always included when running the code.

### Project Detection

The plugin intelligently detects what kind of project you're working with based on common project files. For example:

- If you're in a directory with a `package.json` file, `<leader>rp` will run `npm start`
- If you're in a directory with a `Cargo.toml` file, `<leader>rp` will run `cargo run`

### Custom Commands

You can create custom commands for specific projects or file types by modifying the configuration in `code_runner.lua`. This is especially useful for complex build processes or when you need to run multiple commands in sequence.
