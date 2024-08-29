param(
    [Parameter(Mandatory = $true)]
    [string]$url
)

<#
.SYNOPSIS
Downloads audio from a given URL using yt-dlp and converts it to a specified audio format, storing it in a specified directory.

.DESCRIPTION
This script leverages yt-dlp to download the best available audio from the provided URL. It uses a configuration file to set defaults for the output directory and audio format.

.PARAMETER url
The URL from which to download the audio.

.EXAMPLE
.\DownloadAudio.ps1 -url "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
#>
function Download-Audio
{
    param(
        [string]$videoUrl
    )

    # Load configuration settings from JSON
    $config = Get-Content -Path "config.json" -Raw | ConvertFrom-Json

    # Validate the URL
    if (-not [Uri]::IsWellFormedUriString($videoUrl, [UriKind]::Absolute))
    {
        Write-Host "The provided URL is not valid. Please enter a valid URL." -ForegroundColor Red
        return
    }

    # Define the output template using the configuration settings
    $outputTemplate = Join-Path -Path $config.outputDirectory -ChildPath "%(title)s.%($config.audioFormat)s"

    try
    {
        # Use yt-dlp to download the best audio available and extract to the desired format
        yt-dlp -f "bestaudio" --extract-audio --audio-format $config.audioFormat --audio-quality 0 -o $outputTemplate $videoUrl
        Write-Host "Download and conversion complete." -ForegroundColor Green
    }
    catch
    {
        Write-Host "Failed to download and convert the audio. Error: $_" -ForegroundColor Red
    }
}

# Execute the function with the URL parameter
Download-Audio -videoUrl $url
