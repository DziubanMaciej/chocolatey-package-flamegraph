Uninstall-BinFile flamegraph.pl
$args = @{
    PackageName = 'flamegraph'
    ZipFileName = 'FlameGraph-1.0.zip'
}
UnInstall-ChocolateyZipPackage @args
