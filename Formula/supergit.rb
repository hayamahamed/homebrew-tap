class Supergit < Formula
  desc "Git. Enhanced"
  homepage "https://github.com/hayamahamed/supergit"
  url "https://github.com/hayamahamed/supergit.git", tag: "supergit-latest"
  version "latest"
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
