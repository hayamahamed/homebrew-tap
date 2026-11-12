class Supergit < Formula
  desc "Git. Enhanced"
  homepage "https://github.com/hayamahamed/supergit"
  url "https://github.com/hayamahamed/supergit/archive/refs/tags/supergit-v1.0.9.tar.gz"
  sha256 "3f947c6145240d203508eb78d63c92f806b2ef476be8812b534cb765f109f910"
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
