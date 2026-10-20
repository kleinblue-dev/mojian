# 部署说明（GitHub Pages · 免费）

## 当前状态

| 项 | 值 |
|---|---|
| 仓库 | `kleinblue-dev/mojian`（**public**） |
| Pages 源 | `gh-pages` 分支 · `/`（root） |
| 线上地址 | <https://kleinblue-dev.github.io/mojian/> |
| 构建方式 | legacy（无需 Actions，分支推上去即发布） |
| HTTPS | 已强制 |

## 为什么是 public

GitHub 免费账号**只能从 public 仓库发布 Pages**；私有仓库发布需要 Pro。
本仓库已设为 public，所以 `main` 分支的全部内容（含 `docs/` 里的三份分析文档）对所有人可见。

`gh-pages` 分支只含发布产物：

```
index.html   页面本体
robots.txt   全站禁抓
.nojekyll    跳过 Jekyll 处理
```

## 更新流程

1. 改 `index.html`（或任何需要发布的东西）
2. 仓库根目录执行：

```powershell
./publish.ps1
```

脚本把 `index.html` / `robots.txt` / `.nojekyll` 同步到 `gh-pages` 并推送，Pages 约 30 秒后更新。
改完记得也提交 `main`：`git add -A; git commit -m "..."; git push origin main`。

## 手动发布（不用脚本）

```bash
git checkout gh-pages
git checkout main -- index.html robots.txt .nojekyll
git commit -m "publish"
git push origin gh-pages
git checkout main
```

## 若以后想改回「私有仓库 + 公开站点」

GitHub 免费账号做不到。可选：

- 升级 GitHub Pro（约 $4/月）→ 私有仓库直接开 Pages
- 私有仓库 + Cloudflare Pages / Netlify / Vercel（都支持私有仓库，站点公开）

## 备注

- `noindex, nofollow, noarchive` 与 `robots.txt` 已就位，页面不会被搜索引擎收录（但拿到链接的人当然能打开）。
- 静态页面在浏览器里天然公开：任何人查看源码都能看到全部 HTML/JS。
