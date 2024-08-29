# ChrisChris Audio Downloader

This PowerShell script leverages `yt-dlp` to download the best available audio from video URLs and convert it to MP3 format using `ffmpeg`. Designed with simplicity in mind, it offers an optional parameter for specifying the output directory, making it an efficient tool for users who need to manage audio downloads from various online sources.

## Features

- **High-Quality Audio Downloads**: Automatically fetches the best audio stream available.
- **MP3 Conversion**: Converts any audio format to MP3 using `ffmpeg`.
- **Error Handling**: Implements robust error handling to manage common issues like network errors, invalid URLs, and file access permissions.
- **Customizable Output Directory**: Allows users to specify a custom directory for saving the downloaded files.
- **User-Friendly**: Easy to use with a command-line interface, providing clear instructions and feedback.

## Requirements

- **Python** and **yt-dlp**: `yt-dlp` must be installed via Python's pip.
- **ffmpeg**: Ensure `ffmpeg` is installed and accessible in your system's PATH.
  
## Usage

1. **Download the Script**: Clone this repository or download the `DownloadAudio.ps1` script.
2. **Run the Script**:
    ```powershell
    .\DownloadAudio.ps1 -url "URL" -outputDirectory "Path\To\Directory"
    ```
    Replace `"URL"` with the video link and `"Path\To\Directory"` with your desired save location.

## Contributing

Contributions are welcome! If you have a feature request, bug report, or enhancement, please feel free to open an issue or submit a pull request.

## License

This project is open-sourced under the MIT License. See the LICENSE file for more information.
