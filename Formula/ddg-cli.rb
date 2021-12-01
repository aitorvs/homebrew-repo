class DdgCli < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/ddg-cli"
  url "https://github.com/aitorvs/ddg-cli/releases/download/0.4.0/ddg-cli-0.4.0-binary.jar"
  version "0.4.0"
  sha256 "9dbd4e7b127465461c7cf83a4481ff37a756e291bf02c362f2b2f3b04e369090"

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
