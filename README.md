```
# Brightness Control

A simple script to adjust the brightness of your screen on Linux using `xrandr`.

## How to Use

### 1. Download and Setup

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/MateoMor/brightness-control.git
   ```

2. Navigate to the `brightness-control` directory:
   ```bash
   cd brightness-control
   ```

3. Make the script executable:
   ```bash
   chmod +x brightness-control.sh
   ```

### 2. Running the Script

To adjust the brightness, run the script with a value between 0 and 1. Positive values increase brightness, while negative values decrease it.

```bash
./brightness-control.sh 0.1  # Increase brightness by 0.1
./brightness-control.sh -0.1 # Decrease brightness by 0.1
```

### 3. Add to Shortcuts (Manual Setup)

You can assign this script to a keyboard shortcut for easier access.

#### On GNOME (or similar desktop environments):

1. Open **Settings** and navigate to **Keyboard Shortcuts**.

2. Scroll down and click **Custom Shortcuts** (or similar).

3. Click **Add Custom Shortcut**.

4. Set the **Name** to `Increase Brightness` or `Decrease Brightness`.

5. Set the **Command** to the full path of the script with the desired argument, for example:
   - Increase: `/full/path/to/brightness-control/brightness-control.sh 0.1`
   - Decrease: `/full/path/to/brightness-control/brightness-control.sh -0.1`

6. Assign your preferred key combination (e.g., `Ctrl+Up` for increasing brightness and `Ctrl+Down` for decreasing brightness).

7. Save and close the settings.

### 4. Example Commands

- **Increase brightness by 0.1:**
  ```bash
  ./brightness-control.sh 0.1
  ```

- **Decrease brightness by 0.1:**
  ```bash
  ./brightness-control.sh -0.1
  ```

### 5. Uninstallation

To remove the script, simply delete the `brightness-control` directory:

```bash
rm -rf /path/to/brightness-control
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```
