class Elgato < Formula
  desc "A command line too to control the elgato key lights"
  homepage "https://github.com/aitorvs/elgato"
  url "https://github.com/aitorvs/elgato/releases/download/0.2.0/elgato-0.2.0-binary.jar"
  version "0.2.0"
  sha256 "04e701c8c94d7a17ad5bbdbe53ce676b91acf90701b96a58420d80ee39d37868"

  bottle :unneeded

  depends_on "openjdk"

  def install
  	mv "elgato-#{version}-binary.jar", "elgato.jar"
    libexec.install "elgato.jar"
    bin.write_jar_script libexec/"elgato.jar", "elgato"
  end

  test do
    output = shell_output("#{bin}/elgato --help")
    assert_includes output, "Usage: elgato"
  end
end
