param(
    [Parameter(Mandatory=$true)]
    [string]$url,

    [Parameter(Mandatory=$false)]
    [string]$outputDirectory = ".\"
)

function Download-Audio {
    param(
        [string]$videoUrl,
        [string]$savePath
    )

    # Validate the URL
    if (-not [Uri]::IsWellFormedUriString($videoUrl, [UriKind]::Absolute)) {
        Write-Host "The provided URL is not valid. Please enter a valid URL." -ForegroundColor Red
        return
    }

    # Define the output template for the downloaded file
    $outputTemplate = Join-Path -Path $savePath -ChildPath "%(title)s.%(ext)s"

    try {
        # Use yt-dlp to download the best audio available and extract as MP3
        yt-dlp -f "bestaudio" --extract-audio --audio-format mp3 --audio-quality 0 -o $outputTemplate $videoUrl
        Write-Host "Download and conversion complete." -ForegroundColor Green
    } catch {
        Write-Host "Failed to download and convert the audio. Error: $_" -ForegroundColor Red
    }
}

# Call the function with the URL and optional output directory
Download-Audio -videoUrl $url -savePath $outputDirectory
