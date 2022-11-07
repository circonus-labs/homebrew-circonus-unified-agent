# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusUnifiedAgent < Formula
  desc "Circonus Unified Agent"
  homepage "https://circonus.com"
  version "0.0.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.0.50/circonus-unified-agent_0.0.50_darwin_arm64.tar.gz"
      sha256 "02366a773e3c5edf0bfdb7ae2273b84da92929169af6b32834c4b375a2f39b2c"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        etc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (etc"/conf.d").install "etc/conf.d/readme.md"
        doc.install README.md
        doc.install LICENSE
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.0.50/circonus-unified-agent_0.0.50_darwin_x86_64.tar.gz"
      sha256 "083ab9763f5e888789cf6afe1eed1534d79b59002aedfd851677a7c70b0688c9"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        etc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (etc"/conf.d").install "etc/conf.d/readme.md"
        doc.install README.md
        doc.install LICENSE
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.0.50/circonus-unified-agent_0.0.50_linux_arm64.tar.gz"
      sha256 "5d88d6f98b19f8789cd9c10627b1aec1196b7cd8488979534ecf2903de1f85bd"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        etc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (etc"/conf.d").install "etc/conf.d/readme.md"
        doc.install README.md
        doc.install LICENSE
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.0.50/circonus-unified-agent_0.0.50_linux_x86_64.tar.gz"
      sha256 "cca682eb46c8ad11c03aaba54f9a5fa08a0c09ff6e709fd7f8fc02f5acf47ccd"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        etc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (etc"/conf.d").install "etc/conf.d/readme.md"
        doc.install README.md
        doc.install LICENSE
      end
    end
  end

  def caveats
    <<~EOS
      1. Edit #{etc}/circonus-unified-agent.conf to add your API key.
      2. Run brew service start circonus-unified-agent

      Or, if upgrading, brew service restart circonus-unified-agent
    EOS
  end

  service do
    run [sbin/"circonus-unified-agentd", "--config", etc/"circonus-unified-agent.conf", "--config-dir", etc/"conf.d"]
    keep_alive true
    log_path var/"log/circonus-unified-agent.log"
    error_log_path var/"log/circonus-unified-agent.log"
  end

  test do
    system "#{sbin}/circonus-unified-agentd --version"
  end
end
