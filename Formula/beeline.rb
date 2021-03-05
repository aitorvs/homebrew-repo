class Beeline < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/beeline"
  url "https://github.com/aitorvs/beeline/releases/download/0.1.0/beeline-0.1.0-binary.jar"
  version "0.1.0"
  sha256 "33ab58ed439aad5c6903f2e6e3df66a53d71274eef0b788a8c9ad5f85201e8c6"

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