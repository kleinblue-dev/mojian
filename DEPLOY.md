# 部署到 Cloudflare Pages（免费 · 私有仓库可用）

GitHub 免费账号不能给私有仓库开 Pages（API 返回 422：*Your current plan does not support GitHub Pages for this repository*）。
Cloudflare Pages 免费版**支持私有仓库**，且只读取 `gh-pages` 分支——该分支只有 3 个文件，`docs/` 和源码不会外泄。

## 一次性配置（约 2 分钟，6 步）

1. 打开 <https://dash.cloudflare.com/> → 左侧 **Workers & Pages** → **Create** → **Pages** → **Connect to Git**
2. 授权 GitHub，仓库选择 **`mojian`**（可只授权这一个仓库）
3. 填写配置：

   | 字段 | 值 |
   |---|---|
   | Project name | `mojian` |
   | Production branch | **`gh-pages`** ← 关键，别用 main |
   | Framework preset | `None` |
   | Build command | 留空 |
   | Build output directory | `/`（若提示目录无效，改成 `.`） |

4. 点 **Save and Deploy**，等约 30 秒
5. 得到地址：`https://mojian.pages.dev`
6. 之后每次更新：本地跑 `./publish.ps1` 推送 `gh-pages`，Cloudflare 自动重新发布

## 为什么要单独一个 gh-pages 分支

Cloudflare 发布的是"分支的全部内容"。若指向 `main`，`docs/` 里的三份分析文档会一起被公开。
`gh-pages` 分支只含：

```
index.html    ← 页面本体
robots.txt    ← 全站禁抓
.nojekyll     ← 防止 Jekyll 处理
```

## 备选方案

- 想要纯 GitHub 托管：升级 GitHub Pro（约 $4/月）后，私有仓库可直接开 Pages，地址 `https://kleinblue-dev.github.io/mojian/`
- 完全不想用第三方：本地 `node serve.mjs` + 内网访问，只适合同一 Wi-Fi 下演示

## 隐私提醒

静态页面在浏览器里天然公开——任何人打开页面都能看到 HTML/JS 源码。
`noindex` + `robots.txt` 只能阻止被搜索引擎收录，不能阻止拿到链接的人查看。
