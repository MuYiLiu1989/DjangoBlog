---
name: github-readme-generator
description: 掃描當前專案目錄並自動生成符合Github最佳實踐的 README.md。當使用者要求「生成 Readme」、「更新 Readme」、「寫專案說明書」時觸發。
---

# Github Readme 生成工具

## 概述

這個SKILL引導Agent如何使用本地端程式碼，掃描專案結構與技術堆疊，自動生成一份精美的 `Readme.md`，這份`Readme.md`是提供給Github Repository的首頁呈現使用，且必須包含AI自動產生的免責聲明與功能宣告。

## 執行步驟

1. **步驟1：掃描專案內的技術堆疊**
   使用Antigravity內建的終端機，執行本地端程式碼取得專案的特徵：

   ```bash
   python .antigravity/skills/github-readme-generator/scripts/analyze_project.py
   ```

   - 讀取程式碼回傳的 `stdout`，取得專案使用的主要語言、安裝指令、以及前幾個重要的相依套件。

2. **步驟2：載入Readme結構範本**
   讀取參考文件`references/readme_template.json`。
   - 提取個個區塊預設的Markdown結構(如： `header`,`badge_section`，`agent_generation_notice`等)。

3. **步驟3：組合與撰寫Readme內容**
   在當前專案根目錄下，準備寫入或覆蓋 `README.md`。撰寫時必須遵循以下排版順序：
   - **專案標題與徽章 (Header & Badges)**：從 `readme_templates.json` 中套用。
   - **🤖 Agent 產生宣告**：**必須在 Badges 下方、Table of Contents 上方**，插入 `agent_generation_notice` 中的文字。明確說明「本 README.md 是由 Antigravity IDE AI Agent 自動生成並維護，專門用作 GitHub 門面展示使用」。
   - **目錄與簡介 (TOC & About)**。
   - **快速開始 (Getting Started)**：填入步驟一分析出來的「主要程式語言」、「安裝命令」與「依賴套件」。
   - **專案結構與文件樹**：請自動掃描專案根目錄，列出前兩層的檔案目錄樹（例如使用 `tree` 模擬文字呈現），方便讀者理解專案架構。

4. **步驟4：寫入檔案與確認**
   - 一份專案中只有一份 `Readme.md` 不論是 `README.md`、`Readme.md` 或 `readme.md`，請把舊的 `Readme.md` 移除或覆寫。
   - 將組合好的Markdown內容寫入當前目錄下的 `README.md`。
   - 回覆使用者「README.md已經成功由Antigravity自動生成」，並且將包含「AI產生宣告」的區塊預覽給使用者看

## 限制

- **GitHub 專用定位**：生成的 README 必須定位為「用於 GitHub 儲存庫的展示門面」。
- **路徑正確性**：在 `README.md` 中提及專案其他文件時，必須確保路徑相對於根目錄是正確的。
- **不可編造依賴**：快速開始中的安裝步驟，必須與第一步 `analyze_project.py` 掃描出來的技術棧完全吻合，嚴禁幫 Python 專案寫 npm install。
