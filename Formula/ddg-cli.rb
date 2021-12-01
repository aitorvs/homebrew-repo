class DdgCli < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/ddg-cli"
  url "https://github.com/aitorvs/ddg-cli/releases/download/0.2.0/ddg-cli-0.2.0-binary.jar"
  version "0.2.0"
  sha256 "32d374585eef02076be18a889cbe8886ca03c4d19ba4105cb0c29ca8e267e3a2"

  bottle :unneeded

  depends_on "openjdk"

  def install
  	mv "ddg-cli-#{version}-binary.jar", "ddg-cli.jar"
    libexec.install "ddg-cli.jar"
    bin.write_jar_script libexec/"ddg-cli.jar", "ddg-cli"
  end

  test do
    output = shell_output("#{bin}/ddg-cli --help")
    assert_includes output, "Usage: ddg-cli"
  end
end
