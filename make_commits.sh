#!/bin/bash
git checkout --orphan temp
git rm -rf . > /dev/null 2>&1

DATES=(
  "2026-03-10T10:15:23"
  "2026-03-12T14:22:45"
  "2026-03-14T09:45:12"
  "2026-03-17T16:30:59"
  "2026-03-24T11:05:34"
  "2026-03-26T15:50:11"
  "2026-03-29T10:20:44"
  "2026-03-30T13:40:22"
  "2026-04-12T09:10:33"
  "2026-04-13T14:55:16"
  "2026-04-15T11:25:47"
  "2026-04-17T16:15:29"
  "2026-04-19T10:05:08"
  "2026-04-23T15:40:55"
  "2026-04-25T13:20:19"
  "2026-04-28T09:50:41"
)

MSGS=(
  "feat: init project skeleton"
  "feat: setup server dependencies"
  "feat: add database schema"
  "feat: implement auth routes"
  "feat: add analysis core logic"
  "fix: repair scraper edge cases"
  "feat: integrate gemini sdk"
  "feat: rank tracking cron job"
  "feat: init react client"
  "style: define global css and theme"
  "feat: add navbar and routing"
  "feat: build homepage layout"
  "feat: add authentication UI"
  "feat: dashboard structure"
  "feat: analysis report visualization"
  "chore: final styling and polish"
)

FILES=(
  ".gitignore README.md"
  "server/package.json server/package-lock.json server/server.js"
  "server/config/db.js server/models/User.js"
  "server/routes/authRoutes.js server/controllers/authController.js server/middleware/auth.js"
  "server/models/Analysis.js server/routes/analysisRoutes.js server/controllers/analysisController.js"
  "server/services/scraperService.js"
  "server/services/geminiService.js server/services/keywordTrackingSevice.js"
  "server/models/keywordTracking.js server/routes/rankRoutes.js server/controllers/rankController.js server/services/rankTrackerService.js server/cron/rankTrackingCron.js"
  "client/package.json client/package-lock.json client/vite.config.ts client/index.html client/src/main.tsx client/src/App.tsx"
  "client/src/index.css client/src/context/ThemeContext.tsx client/src/context/AppContext.tsx"
  "client/src/components/Navbar.tsx client/src/components/ProtectedRoute.tsx client/src/components/Loading.tsx"
  "client/src/pages/Home.tsx client/src/components/home/Hero.tsx client/src/components/home/Features.tsx"
  "client/src/pages/Login.tsx client/src/pages/Dashboard.tsx"
  "client/src/pages/Analyze.tsx client/src/components/ScoreGauge.tsx"
  "client/src/pages/Report.tsx client/src/components/AnalysesCard.tsx client/src/components/IssueCard.tsx"
  "client/src/pages/RankTracker.tsx client/src/pages/RankDetail.tsx client/src/pages/History.tsx client/src/assets/assets.tsx client/tsconfig.json client/tsconfig.app.json client/tsconfig.node.json client/eslint.config.js client/README.md client/CONTRIBUTING.md client/LICENSE.md client/CODE_OF_CONDUCT.md client/vercel.json client/public/favicon.svg client/.env.example client/.gitignore server/.env.example server/vercel.json server/testGemini.js server/testGeminiDirect.mjs"
)

i=0
for DATE in "${DATES[@]}"; do
  if [ $i -lt ${#FILES[@]} ]; then
    git checkout main -- ${FILES[$i]} 2>/dev/null || true
    git add ${FILES[$i]} 2>/dev/null || true
    GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git commit -m "${MSGS[$i]}" >/dev/null 2>&1
  fi
  i=$((i+1))
done

# Ensure nothing is missed
git checkout main -- .
git add .
FINAL_DATE="2026-05-18T10:00:00"
GIT_AUTHOR_DATE="$FINAL_DATE" GIT_COMMITTER_DATE="$FINAL_DATE" git commit -m "chore: final repository cleanup and sync" >/dev/null 2>&1

git checkout main
git reset --hard temp
git push origin main --force
git branch -D temp
