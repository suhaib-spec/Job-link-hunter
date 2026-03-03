# 🔗 Job Link Hunter

**Automated job posting monitor for [Jobright.ai](https://jobright.ai)**

Scrapes the most recent job postings from Jobright.ai and saves them to an Excel file. Runs on a loop, refreshing periodically to catch new listings as they appear.

---

## Features

- **Auto-login detection** — Opens Chrome and waits for you to sign in (session saved for future runs)
- **"Most Recent" sorting** — Automatically selects the Most Recent sort order
- **Smart extraction** — Handles Jobright's virtualized list by extracting jobs incrementally during scrolling
- **Time filtering** — Only saves jobs posted within the last 60 minutes (configurable)
- **Duplicate detection** — Tracks previously saved jobs to avoid duplicates
- **Excel output** — Clean, styled spreadsheet with job links, titles, companies, and more
- **Auto-retry saves** — Retries if Excel is open, falls back to a timestamped file if needed

## Quick Start

### 1. Install dependencies

```bash
pip install -r requirements.txt
```

### 2. Run the script

```bash
python job_hunter.py
```

Or double-click `run_hunter.bat` on Windows.

### 3. First run — Log in

A Chrome window will open. Sign in to Jobright.ai — the script will detect your login and start scraping automatically. Your session is saved for future runs.

## Configuration

Edit the constants at the top of `job_hunter.py`:

| Setting | Default | Description |
|---|---|---|
| `CHECK_INTERVAL_MINUTES` | `15` | Minutes between scrape cycles |
| `MAX_SCROLLS` | `20` | Maximum scroll iterations per cycle |
| `MAX_JOB_AGE_MINUTES` | `60` | Only keep jobs posted within this window |
| `SCROLL_PAUSE_SECONDS` | `2.0` | Pause between scrolls for content to load |

## Output

Jobs are saved to `job_postings.xlsx` with these columns:

| Column | Description |
|---|---|
| Job Link | URL to the job posting |
| Title | Job title |
| Company | Company name |
| Location | City, state, or Remote |
| Salary | Salary range (if listed) |
| Job Type | Full-time, Contract, etc. |
| Work Model | Remote, Hybrid, Onsite |
| Date Posted | How recently the job was posted |
| First Seen | Timestamp when the script first found it |

## Requirements

- Python 3.10+
- Google Chrome (installed)
- Dependencies: `selenium`, `webdriver-manager`, `openpyxl`

## How It Works

1. Launches Chrome with a dedicated profile (won't interfere with your regular browser)
2. Navigates to Jobright.ai and detects login status
3. Clicks the sort dropdown to select "Most Recent"
4. Scrolls through the job list, extracting cards incrementally (handles virtualized rendering)
5. Filters jobs to only those posted within the configured time window
6. Clicks job titles to capture direct URLs
7. Appends new jobs to the Excel file
8. Waits and repeats

## License

MIT
