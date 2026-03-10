# SEO Pilot

A full-stack MERN application for tracking SEO keywords, analyzing trends using Google Gemini AI, and scraping data via Browserbase and Playwright.

## 🚀 Tech Stack

### Frontend
- **Framework**: React 19 (via Vite)
- **Styling**: Tailwind CSS 4.3, Lucide React (Icons)
- **Routing**: React Router DOM
- **Data Fetching**: Axios
- **State Management**: React Context API
- **Language**: TypeScript

### Backend
- **Framework**: Node.js with Express.js
- **Database**: MongoDB (via Mongoose)
- **Authentication**: JWT (JSON Web Tokens) & bcrypt
- **Web Scraping**: Browserbase SDK & Playwright Core
- **AI Integration**: Google GenAI (Gemini) SDK
- **Task Scheduling**: Node-cron (for rank tracking)
- **Language**: JavaScript (ES Modules)

## 📁 Project Architecture & Structure

The project is structured as a standard monorepo containing separate `client` and `server` directories.

```text
SEO_rank_tracker/
├── client/                 # Frontend React Application
│   ├── public/             # Static assets
│   ├── src/                # React source code (components, context, pages, etc.)
│   ├── package.json        # Frontend dependencies & scripts
│   ├── vite.config.ts      # Vite configuration
│   └── .env                # Frontend environment variables
└── server/                 # Backend Node.js Application
    ├── config/             # Database connection configuration
    ├── controllers/        # Route controllers
    ├── cron/               # Scheduled tasks for automatic rank tracking
    ├── middleware/         # Custom middlewares (e.g., Auth)
    ├── models/             # Mongoose database schemas
    ├── routes/             # API route definitions
    ├── services/           # Business logic (Scraping, AI, Rank tracking)
    ├── server.js           # Main application entry point
    ├── package.json        # Backend dependencies & scripts
    └── .env                # Backend environment variables
```

## ⚙️ Environment Variables

### Client (`client/.env`)
Create a `.env` file in the `client` directory:
```env
VITE_BACKEND_URL="http://localhost:5000"
```

### Server (`server/.env`)
Create a `.env` file in the `server` directory:
```env
PORT=5000
JWT_SECRET="any_strong_secret"
MONGODB_URI="mongodb://localhost:27017/seo_rank_tracker"
BROWSERBASE_API_KEY="your_browserbase_api_key"
GEMINI_API_KEY="your_gemini_api_key"
```

> **Note**: For local setup, you need to run a local MongoDB instance on port 27017, or replace the `MONGODB_URI` with your own MongoDB Atlas connection string. You'll also need valid API keys for Browserbase and Gemini if you want to use the scraping and AI features.

## 💻 Local Setup & Running the Project

### Prerequisites
- Node.js (v18+ recommended)
- MongoDB running locally (or an Atlas URI)

### 1. Backend Setup

Open a terminal and run the following commands:
```bash
cd server
npm install
npm run server
```
*The server will start on `http://localhost:5000`.*

### 2. Frontend Setup

Open a new terminal and run the following commands:
```bash
cd client
npm install
npm run dev
```
*The client will start, typically on `http://localhost:5173`.*

## 🚀 Deployment Notes

- **Frontend (Vercel/Netlify)**:
  - Framework Preset: `Vite`
  - Build Command: `npm run build`
  - Output Directory: `dist`
  - Make sure to set the Environment Variable `VITE_BACKEND_URL` to your deployed backend URL.
  
- **Backend (Render/Railway)**:
  - Build Command: `npm install`
  - Start Command: `npm start`
  - Ensure all environment variables (`PORT`, `JWT_SECRET`, `MONGODB_URI`, `BROWSERBASE_API_KEY`, `GEMINI_API_KEY`) are configured in the hosting provider's dashboard.
