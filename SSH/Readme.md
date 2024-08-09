
```markdown
# SSH Brute-Force Script

This Bash script performs a brute-force attack against an SSH server by attempting to log in with a list of commonly used usernames and passwords. The script is intended for educational purposes and security testing on your own systems.

## Features

- Accepts target IP and port as command-line arguments.
- Supports a verbose mode to display the credentials being tested.
- Uses the `rockyou.txt` wordlist for password attempts.

## Prerequisites

- **sshpass**: The script uses `sshpass` to supply the password to SSH non-interactively.
- **rockyou.txt**: This is a popular password wordlist used for brute-force attacks. You can download it from [SecLists](https://github.com/danielmiessler/SecLists/blob/master/Passwords/Leaked-Databases/rockyou.txt.tar.gz).

## Installation

1. **Install `sshpass`:**
    ```bash
    sudo apt-get install sshpass
    ```

2. **Download and extract `rockyou.txt`:**
    ```bash
    wget https://github.com/danielmiessler/SecLists/raw/master/Passwords/Leaked-Databases/rockyou.txt.tar.gz
    tar -xvf rockyou.txt.tar.gz
    sudo mv rockyou.txt /usr/share/wordlists/
    ```

## Usage

To run the script, use the following command format:

```bash
./ssh-bruteforce.sh -t TARGET_IP -p PORT [-v]
```

### Example:

```bash
./ssh-bruteforce.sh -t 172.16.10.13 -p 22 -v
```

- `-t TARGET_IP`: Specifies the target IP address.
- `-p PORT`: Specifies the target SSH port.
- `-v`: Enables verbose mode, showing each credential attempt.

### Output

If the script finds valid credentials, it will display the successful username and password combination. If no valid credentials are found, it will notify you that no valid credentials were detected.

### Example Output:

```bash
Starting SSH credential testing on 172.16.10.13:22...
Testing credentials: root / 123456
Testing credentials: root / password
...
Successful login with credentials:
Host: 172.16.10.13
Username: root
Password: admin
```

## Important Notes

- **Ethical Use**: This script is meant for educational purposes and should only be used on systems you own or have explicit permission to test.
- **Wordlist**: The `rockyou.txt` wordlist contains millions of common passwords. Its effectiveness depends on the target's password complexity.


## Disclaimer

This tool is intended solely for legal and ethical purposes. Misuse of this tool may lead to criminal charges. The authors are not responsible for any illegal activities carried out with this tool. Use responsibly.
```

### How to Use:
1. **Clone the repository** containing this script and `README.md` to your local machine.
2. Follow the installation steps mentioned in the README.
3. Run the script as described.

This `README.md` is formatted for GitHub, providing clear instructions on how to use your script, set up the environment, and ensure users understand the ethical considerations involved.
