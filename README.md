# 墨间 · 一段与自己的相处

一段约 8 分钟的**水墨自我陪伴练习**交互原型。8 步闭环：知情 → 前测 → 择境 → 六轮墨语 → 落墨 → 后测 → 结果 → 收卷。

> ⚠️ 这是一段自我陪伴的练习，**不是医疗建议**，也不替代任何专业支持。原型中的引导语是本地预置文本，不是实时 AI。

## 线上地址

GitHub Pages 发布 `gh-pages` 分支：

```
https://kleinblue-dev.github.io/mojian/
```

> 仓库为 **public**：GitHub 免费账号只能从公开仓库发布 Pages。
> 这意味着 `main` 分支里的 `docs/` 三份分析文档也是公开的。
> 配置与更新方式见 [DEPLOY.md](DEPLOY.md)。

## 仓库结构

```
index.html      ← 单文件应用（内联全部 CSS/JS，零依赖、零网络请求）
robots.txt      ← 禁止搜索引擎抓取
docs/           ← 分析文档（仅在 private 仓库可见，不会发布到 Pages）
publish.ps1     ← 把 index.html 发布到 gh-pages 分支
```

## 更新流程

1. 改 `index.html`
2. 在仓库根目录执行：

```powershell
./publish.ps1
```

脚本会把 `index.html` / `robots.txt` / `.nojekyll` 同步到 `gh-pages` 分支并推送，Pages 约 30 秒后自动更新。

## 隐私与技术

- 页面**不发出任何网络请求**，没有 CDN、没有字体外链、没有埋点。
- 所有作答与墨迹只存在访问者自己浏览器的 `localStorage` 里，可一键清除。
- 单文件约 91 KB，手机 375px 宽实测无横向溢出，可离线打开。

## 关于公开范围

本仓库已设为 **public**（GitHub 免费账号发布 Pages 的前提），所以：

- **公开**：`index.html` 页面源码、`docs/` 三份分析文档、README、部署脚本
- **不会发布到站点**：`docs/` 只在仓库里可见，不会出现在 `gh-pages` 页面上
- 页面加了 `noindex` + `robots.txt`，不会被搜索引擎收录

需要说明：**静态页面在浏览器里本来就是公开的**——任何人打开页面都能看到 HTML/JS 源码。若以后需要真正隐藏实现细节，唯一办法是把核心逻辑放到服务端。
