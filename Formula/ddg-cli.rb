class DdgCli < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/ddg-cli"
  url "https://github.com/aitorvs/ddg-cli/releases/download/0.1.0/ddg-cli-0.1.0-binary.jar"
  version "0.1.0"
  sha256 "33ab58ed439aad5c6903f2e6e3df66a53d71274eef0b788a8c9ad5f85201e8c6"

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
