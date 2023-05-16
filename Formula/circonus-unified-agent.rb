# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusUnifiedAgent < Formula
  desc "Circonus Unified Agent"
  homepage "https://circonus.com"
  version "0.2.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.13/circonus-unified-agent_0.2.13_darwin_arm64.tar.gz"
      sha256 "c8981693c0be48cd05aae91c66cb8bc021e496dd5ff41c17afda4f2dc6ac0dc9"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.13/circonus-unified-agent_0.2.13_darwin_amd64.tar.gz"
      sha256 "5587d74e89f5a86e45a5d0c133d0b1bbfe106569a4906bb895bdfab20252c687"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.13/circonus-unified-agent_0.2.13_linux_arm64.tar.gz"
      sha256 "371109a138fabb1ea4f4b3a7ff6ae0f1923aaf630f04d79d1ac39b2c39002bd7"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.13/circonus-unified-agent_0.2.13_linux_amd64.tar.gz"
      sha256 "af7c11b32046acc5c8e417e5095db033995b9d37d46927cb7749e1e73e573dad"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
  end

  def caveats
    <<~EOS
      1. Edit #{plist_name} and add your API token in API_TOKEN environment variable setting
      2. Run "brew services start circonus-unified-agent"

      Or, if upgrading, run "brew services restart circonus-unified-agent"
    EOS
  end

  service do
    run [opt_sbin/"circonus-unified-agentd", "--config", etc/"circonus-unified-agent/circonus-unified-agent.conf", "--config-directory", etc/"circonus-unified-agent/conf.d"]
    keep_alive true
    log_path var/"log/circonus-unified-agent.log"
    error_log_path var/"log/circonus-unified-agent.log"
  end

  test do
    system "#{sbin}/circonus-unified-agentd --version"
  end
end
