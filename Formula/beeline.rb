class Beeline < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/beeline"
  url "https://github.com/aitorvs/beeline/releases/download/0.3.0/beeline-0.3.0-binary.jar"
  version "0.3.0"
  sha256 "19523ba0d8cbd32b069b71e8fef4187cda61e379054faac72f31abd430ea46a0"

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