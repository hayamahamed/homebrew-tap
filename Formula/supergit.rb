class Supergit < Formula
  desc "Git. Enhanced"
  homepage "https://github.com/hayamahamed/supergit"
  url "https://github.com/hayamahamed/supergit/archive/refs/tags/supergit-v1.0.12.tar.gz"
  sha256 "125ed570719e491927ac8e2efccf17a9e6847a8676fbc0975d2660918f88a02d"
  license "MIT"
  head "https://github.com/hayamahamed/supergit.git", branch: "main"

  depends_on "python@3.13"
  depends_on "git"

  def install
    bin.install Dir["src/bin/*"]
    (lib/"supergit").install Dir["src/lib/supergit/*"]
  end

  test do
    %w[
      supergit
      git-adc
      git-fastfind
      git-multitag
      git-nuke
    ].each do |command|
      assert_predicate bin/command, :executable?
    end
  end
end
