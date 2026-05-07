// PM2 Configuration pour JOY-MD-V2
module.exports = {
  apps: [{
    name: 'joy-md',
    script: 'Joy.js',
    cwd: './joy-md-v2',
    instances: 1,
    exec_mode: 'fork',
    watch: false,
    autorestart: true,
    max_restarts: 10,
    min_uptime: '10s',
    restart_delay: 5000,
    env: {
      NODE_ENV: 'production',
      NODE_OPTIONS: '--max-old-space-size=512'
    },
    error_file: './logs/joy-md-error.log',
    out_file: './logs/joy-md-out.log',
    log_file: './logs/joy-md-combined.log',
    time: true
  }]
};
