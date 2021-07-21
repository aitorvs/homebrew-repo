class Beeline < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/beeline"
  url "https://github.com/aitorvs/beeline/releases/download/0.4.0/beeline-0.4.0-binary.jar"
  version "0.4.0"
  sha256 "c43076e24bbdf7742277f495c33baec51933d8949e84c423f5f336ec731c6d76"

  bottle :unneeded

  depends_on "openjdk"

  def install
  	mv "beeline-#{version}-binary.jar", "beeline.jar"
    libexec.install "beeline.jar"
    bin.write_jar_script libexec/"beeline.jar", "beeline"
  end

  test do
    output = shell_output("#{bin}/beeline --help")
    assert_includes output, "Usage: beeline"
  end
end