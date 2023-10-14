$ErrorActionPreference = 'Stop'

# Get folder to install
$packageParams = Get-PackageParameters
$folder = $packageParams.folder
if (-Not $folder) {
    $folder = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
}

# Download and install package
$args = @{
    PackageName    = 'flamegraph'
    Url            = 'https://github.com/brendangregg/FlameGraph/archive/refs/tags/v1.0.zip'
    UnzipLocation  = $folder
    SpecificFolder = 'Flamegraph-1.0'
    Checksum       = 'CDC44814F73A21EF1CF32DAB1E34E49E'
}
Install-ChocolateyZipPackage @args

# If perl is available, create a link to the flamegraph script in PATH
$perlCommand = Get-Command perl -ErrorAction Ignore
if ($perlCommand) {
    Install-BinFile -Name flamegraph.pl -Path $perlCommand.Path -Command $folder\FlameGraph-1.0\flamegraph.pl
}
