class M < Formula
  desc "MD-driven agent CLI for code, infrastructure, and automation"
  homepage "https://github.com/subzone/Agentctl"
  url "https://github.com/subzone/Agentctl/archive/refs/tags/v0.0.33.tar.gz"
  sha256 "30e0df7d4affdf61f75000b55670b5b7b8100e722404377c2944587e3c766c4a"
  license "MIT"
  head "https://github.com/subzone/Agentctl.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "-o", bin/"m", "./cmd/m"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/m --version")
  end
end
