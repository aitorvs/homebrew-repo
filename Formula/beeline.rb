class Beeline < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/beeline"
  url "https://github.com/aitorvs/beeline/releases/download/0.3.1/beeline-0.3.1-binary.jar"
  version "0.3.1"
  sha256 "add3f819fe505888ce5452d539ab2ad925b0b44352979a9132c9d3be29c7e527"

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