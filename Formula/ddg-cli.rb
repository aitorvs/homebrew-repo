class DdgCli < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/ddg-cli"
  url "https://github.com/aitorvs/ddg-cli/releases/download/0.5.0/ddg-cli-0.5.0-binary.jar"
  version "0.5.0"
  sha256 "87d469dcde759993d43c9e33dbc190bdee818320e99fe643ecdb9015fab4b242"

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
