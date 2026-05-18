<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mastering Bash Scripting - Premium Presentation</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Plus Jakarta Sans', 'sans-serif'],
                        mono: ['JetBrains Mono', 'monospace'],
                    },
                    colors: {
                        cyber: {
                            950: '#030712',
                            900: '#080c14',
                            800: '#0e1726',
                            700: '#1c2e4a',
                            600: '#2b4570',
                            accent: '#10b981', // Emerald
                            glow: '#059669',
                            secondary: '#06b6d4', // Cyan
                        }
                    }
                }
            }
        }
    </script>
    <style>
        /* Modern high-end layout styles */
        .glass-panel {
            background: rgba(13, 22, 38, 0.7);
            backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.05);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
        }
        .glow-button:hover {
            box-shadow: 0 0 20px rgba(16, 185, 129, 0.4);
        }
        /* Custom slide transitions */
        .slide-frame {
            transition: opacity 0.5s cubic-bezier(0.16, 1, 0.3, 1), transform 0.5s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .slide-hidden {
            display: none !important;
            opacity: 0;
            transform: scale(0.97) translateY(10px);
        }
        .slide-active {
            display: flex !important;
            opacity: 1;
            transform: scale(1) translateY(0);
        }
        /* Custom scrollbars */
        ::-webkit-scrollbar {
            width: 5px;
            height: 5px;
        }
        ::-webkit-scrollbar-track {
            background: #030712;
        }
        ::-webkit-scrollbar-thumb {
            background: #1c2e4a;
            border-radius: 999px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #10b981;
        }
        /* Cursor Blink animation */
        @keyframes blink {
            50% { opacity: 0; }
        }
        .terminal-cursor {
            animation: blink 1s step-end infinite;
        }
        /* Pulse for highlights */
        .live-pulse {
            box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.5);
            animation: pulse-animation 1.5s infinite;
        }
        @keyframes pulse-animation {
            0% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(16, 185, 129, 0); }
            100% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0); }
        }
    </style>
</head>
<body class="bg-[#030712] text-slate-100 font-sans min-h-screen flex flex-col justify-between overflow-x-hidden antialiased">

    <!-- DECORATIVE BG GLOWS -->
    <div class="fixed top-0 left-1/4 w-96 h-96 bg-emerald-500/5 rounded-full blur-[120px] pointer-events-none -z-10"></div>
    <div class="fixed bottom-0 right-1/4 w-[500px] h-[500px] bg-cyan-500/5 rounded-full blur-[150px] pointer-events-none -z-10"></div>

    <!-- MAIN NAV HEADER -->
    <header class="border-b border-slate-900 bg-slate-950/40 backdrop-blur-xl px-4 lg:px-8 py-3.5 sticky top-0 z-50 flex items-center justify-between">
        <div class="flex items-center gap-4">
            <!-- Animated Terminal Icon -->
            <div class="relative flex items-center justify-center w-11 h-11 bg-gradient-to-br from-emerald-500/20 to-emerald-500/5 rounded-xl border border-emerald-500/30 text-emerald-400 font-mono font-bold text-lg shadow-lg">
                <span class="absolute inline-flex h-full w-full rounded-xl bg-emerald-500/10 animate-ping opacity-75"></span>
                &gt;_
            </div>
            <div>
                <div class="flex items-center gap-2">
                    <h1 class="text-xs lg:text-sm font-black text-slate-100 uppercase tracking-widest">
                        BASH COMMAND ACADEMY
                    </h1>
                    <span class="text-[9px] bg-emerald-500/20 border border-emerald-500/30 text-emerald-300 px-2 py-0.5 rounded-full font-mono font-semibold tracking-wider">PREMIUM CLASS</span>
                </div>
                <p class="text-[10px] text-slate-500 tracking-wider">Interactive Presentation &amp; Workspace Tools</p>
            </div>
        </div>

        <!-- Upper Control Toolbar -->
        <div class="flex items-center gap-2">
            <button onclick="toggleSidebar()" class="bg-slate-900/60 hover:bg-slate-800 border border-slate-800/80 text-slate-300 px-3 py-1.5 rounded-lg text-xs font-semibold flex items-center gap-2 transition" title="Table of Chapters">
                <i class="fa-solid fa-list-check text-emerald-400"></i> <span class="hidden md:inline">Index Map</span>
            </button>
            <button onclick="toggleCheatSheet()" class="bg-slate-900/60 hover:bg-slate-800 border border-slate-800/80 text-slate-300 px-3 py-1.5 rounded-lg text-xs font-semibold flex items-center gap-2 transition" title="Syntax Quick Reference">
                <i class="fa-solid fa-fire text-amber-400"></i> <span class="hidden md:inline">Quick Notes</span>
            </button>
            <button onclick="toggleFullScreen()" class="bg-slate-900/60 hover:bg-slate-800 border border-slate-800/80 text-slate-300 p-2 rounded-lg text-xs transition" title="Toggle Widescreen Mode">
                <i class="fa-solid fa-expand"></i>
            </button>
        </div>
    </header>

    <!-- CONTENT FRAME -->
    <main class="flex-grow flex w-full max-w-7xl mx-auto p-3 md:p-6 lg:p-8 relative gap-6">

        <!-- MAP MENU SIDEBAR -->
        <aside id="sidebar" class="fixed inset-y-0 left-0 z-40 w-80 bg-[#060a12]/95 border-r border-slate-900 p-6 transform -translate-x-full transition-transform duration-300 ease-in-out lg:relative lg:translate-x-0 lg:flex lg:flex-col lg:z-10 rounded-2xl shadow-2xl shrink-0 hidden lg:block overflow-hidden">
            <div class="flex items-center justify-between pb-4 border-b border-slate-900">
                <h2 class="text-xs font-black tracking-widest text-emerald-400 uppercase">COURSE CHAPTERS</h2>
                <button onclick="toggleSidebar()" class="lg:hidden text-slate-400 hover:text-slate-100">
                    <i class="fa-solid fa-xmark text-lg"></i>
                </button>
            </div>
            
            <!-- Slides Navigation list with scrollbar support for many chapters -->
            <nav class="flex-grow overflow-y-auto space-y-1.5 mt-4 pr-1 max-h-[70vh]" id="slide-index-list">
                <!-- Javascript will inject clean interactive panels here -->
            </nav>

            <div class="mt-4 pt-4 border-t border-slate-900 text-center">
                <div class="inline-flex gap-2 text-[10px] text-slate-500 items-center justify-center font-mono">
                    <kbd class="px-1.5 py-0.5 bg-slate-950 border border-slate-900 text-slate-400 rounded">←</kbd>
                    <span>and</span>
                    <kbd class="px-1.5 py-0.5 bg-slate-950 border border-slate-900 text-slate-400 rounded">→</kbd>
                    <span>to navigate</span>
                </div>
            </div>
        </aside>

        <!-- CHEAT SHEET COMPLEMENTARY SIDE PANEL -->
        <aside id="cheatsheet" class="fixed inset-y-0 right-0 z-40 w-80 md:w-96 bg-[#060a12]/95 border-l border-slate-900 p-6 transform translate-x-full transition-transform duration-300 ease-in-out flex flex-col shadow-2xl overflow-y-auto hidden">
            <div class="flex items-center justify-between mb-4 pb-3 border-b border-slate-900">
                <h2 class="font-extrabold text-xs text-amber-400 tracking-wider uppercase flex items-center gap-2">
                    <i class="fa-solid fa-bolt-lightning"></i> Bash Syntax Cheats
                </h2>
                <button onclick="toggleCheatSheet()" class="text-slate-400 hover:text-slate-100">
                    <i class="fa-solid fa-xmark text-lg"></i>
                </button>
            </div>
            <div class="space-y-4 text-xs">
                <div class="bg-slate-950/60 p-3 rounded-lg border border-slate-900">
                    <h3 class="font-bold text-slate-200 mb-1 flex items-center gap-1.5"><i class="fa-solid fa-folder text-emerald-400"></i> File Verification Tests</h3>
                    <ul class="space-y-1.5 font-mono text-[10px] text-slate-400">
                        <li><span class="text-emerald-400">-e file</span> : File exists</li>
                        <li><span class="text-emerald-400">-f file</span> : Is typical data file</li>
                        <li><span class="text-emerald-400">-d dir</span> : Is active directory</li>
                        <li><span class="text-emerald-400">-r file</span> : File has read access</li>
                    </ul>
                </div>
                <div class="bg-slate-950/60 p-3 rounded-lg border border-slate-900">
                    <h3 class="font-bold text-slate-200 mb-1 flex items-center gap-1.5"><i class="fa-solid fa-calculator text-cyan-400"></i> Numeric Comparisons</h3>
                    <ul class="space-y-1.5 font-mono text-[10px] text-slate-400">
                        <li><span class="text-cyan-400">-eq</span> : Equal</li>
                        <li><span class="text-cyan-400">-ne</span> : Not Equal</li>
                        <li><span class="text-cyan-400">-lt</span> : Less than</li>
                        <li><span class="text-cyan-400">-le</span> : Less than or equal</li>
                        <li><span class="text-cyan-400">-gt</span> : Greater than</li>
                    </ul>
                </div>
                <div class="bg-slate-950/60 p-3 rounded-lg border border-slate-900">
                    <h3 class="font-bold text-slate-200 mb-1 flex items-center gap-1.5"><i class="fa-solid fa-font text-purple-400"></i> String Comparisons</h3>
                    <ul class="space-y-1.5 font-mono text-[10px] text-slate-400">
                        <li><span class="text-purple-400">==</span> : Same string match</li>
                        <li><span class="text-purple-400">!=</span> : String mismatch</li>
                        <li><span class="text-purple-400">-z str</span> : String is empty</li>
                        <li><span class="text-purple-400">-n str</span> : String is NOT empty</li>
                    </ul>
                </div>
                <div class="bg-slate-950/60 p-3 rounded-lg border border-slate-900">
                    <h3 class="font-bold text-slate-200 mb-1 flex items-center gap-1.5"><i class="fa-solid fa-terminal text-yellow-400"></i> Built-in Globals</h3>
                    <ul class="space-y-1.5 font-mono text-[10px] text-slate-400">
                        <li><span class="text-yellow-400">$?</span> : Exit code status of last command</li>
                        <li><span class="text-yellow-400">$#</span> : Number of input arguments</li>
                        <li><span class="text-yellow-400">$$</span> : Current Shell PID index</li>
                    </ul>
                </div>
            </div>
        </aside>

        <!-- MAIN PRESENTATION CONTAINER -->
        <div class="flex-grow flex flex-col justify-between glass-panel rounded-2xl p-5 md:p-8 relative min-h-[500px] md:min-h-[640px] border border-slate-800/40 shadow-2xl overflow-hidden">
            
            <!-- STAGE: CENTRAL SLIDE DECK VIEWPORT -->
            <div class="flex-grow flex flex-col justify-center relative">

                <!-- SLIDE 0: TITLE AND HERO INDEX -->
                <div id="slide-0" class="slide-frame slide-active flex flex-col items-center justify-center text-center py-6 md:py-12 space-y-6">
                    <div class="inline-flex items-center gap-2 px-3 py-1 bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 rounded-full text-[10px] font-mono tracking-widest uppercase">
                        <span class="w-1.5 h-1.5 bg-emerald-400 rounded-full animate-ping"></span>
                        interactive deployment guide
                    </div>
                    <h1 class="text-3xl md:text-5xl lg:text-6xl font-black tracking-tight leading-none text-transparent bg-clip-text bg-gradient-to-br from-white via-slate-100 to-slate-400 max-w-4xl">
                        Become a Master of <br>
                        <span class="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 via-teal-400 to-cyan-400">Bash Command Scripting</span>
                    </h1>
                    <p class="text-slate-400 text-xs md:text-sm lg:text-base max-w-2xl leading-relaxed font-light">
                        Write lightning-fast command strings, create automated deployment loops, and master variables, conditions, and real-time outputs natively.
                    </p>
                    
                    <div class="flex flex-wrap items-center justify-center gap-3 pt-6">
                        <button onclick="goToSlide(1)" class="glow-button bg-emerald-500 hover:bg-emerald-400 text-slate-950 px-6 py-3 rounded-xl font-extrabold text-xs tracking-wider uppercase flex items-center gap-2 transition-all duration-300">
                            Begin Core Course <i class="fa-solid fa-arrow-right"></i>
                        </button>
                        <button onclick="goToSlide(7)" class="bg-slate-900 hover:bg-slate-800 border border-slate-800 text-slate-200 px-6 py-3 rounded-xl font-extrabold text-xs tracking-wider uppercase flex items-center gap-2 transition">
                            <i class="fa-solid fa-terminal text-emerald-400"></i> Open Sandbox Workspace
                        </button>
                    </div>

                    <div class="flex flex-wrap items-center justify-center gap-6 pt-10 border-t border-slate-900/60 w-full max-w-xl text-[10px] text-slate-500 font-mono">
                        <span class="flex items-center gap-1.5"><i class="fa-solid fa-check text-emerald-500"></i> Writable Editor</span>
                        <span class="flex items-center gap-1.5"><i class="fa-solid fa-check text-emerald-500"></i> Condition Inspector</span>
                        <span class="flex items-center gap-1.5"><i class="fa-solid fa-check text-emerald-500"></i> Interactive Loop Tracer</span>
                    </div>
                </div>

                <!-- SLIDE 1: INTRODUCTION TO BASH -->
                <div id="slide-1" class="slide-frame slide-hidden flex-col space-y-5">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 01</span><span>/</span><span>The Foundations</span>
                    </div>
                    <h2 class="text-2xl md:text-3xl font-extrabold text-slate-100 tracking-tight">What is Bash Scripting?</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <div class="lg:col-span-7 flex flex-col justify-between space-y-4 text-slate-300 text-xs md:text-sm leading-relaxed">
                            <p>
                                A <strong class="text-emerald-400 font-bold">Bash Script</strong> is a plain text file containing a sequence of commands executed sequentially by the terminal program, just as if you entered them yourself.
                            </p>
                            <p>
                                Instead of typing complex build directives repeatedly, write them into a script to automate and execute everything with a single command.
                            </p>

                            <!-- Process Flow Icons -->
                            <div class="grid grid-cols-3 gap-3 bg-slate-950/40 border border-slate-900 p-3 rounded-xl text-center">
                                <div class="p-2 space-y-1 bg-slate-900/40 rounded-lg border border-slate-900/50">
                                    <div class="text-emerald-400 text-lg"><i class="fa-solid fa-file-code"></i></div>
                                    <div class="text-[10px] font-bold text-slate-200">1. Plain Script</div>
                                    <p class="text-[9px] text-slate-500">Write text rules</p>
                                </div>
                                <div class="p-2 space-y-1 bg-slate-900/40 rounded-lg border border-slate-900/50">
                                    <div class="text-cyan-400 text-lg"><i class="fa-solid fa-key"></i></div>
                                    <div class="text-[10px] font-bold text-slate-200">2. chmod +x</div>
                                    <p class="text-[9px] text-slate-500">Grant run access</p>
                                </div>
                                <div class="p-2 space-y-1 bg-slate-900/40 rounded-lg border border-slate-900/50">
                                    <div class="text-purple-400 text-lg"><i class="fa-solid fa-forward"></i></div>
                                    <div class="text-[10px] font-bold text-slate-200">3. Run Exec</div>
                                    <p class="text-[9px] text-slate-500">Process instantly</p>
                                </div>
                            </div>
                        </div>

                        <!-- Graphical Window Card -->
                        <div class="lg:col-span-5 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col shadow-lg">
                            <div class="bg-slate-900/80 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400 flex items-center gap-1.5">
                                    <span class="w-2.5 h-2.5 bg-red-500/80 rounded-full"></span>
                                    <span class="w-2.5 h-2.5 bg-yellow-500/80 rounded-full"></span>
                                    <span class="w-2.5 h-2.5 bg-green-500/80 rounded-full"></span>
                                    why_bash.sh
                                </span>
                            </div>
                            <div class="p-4 font-mono text-[11px] text-slate-300 space-y-2 flex-grow">
                                <div class="text-slate-500"># Compiling multiple developer logs</div>
                                <div><span class="text-rose-400">SRC_DIR</span>=<span class="text-emerald-400">"/data/logs"</span></div>
                                <div><span class="text-rose-400">OUT</span>=<span class="text-emerald-400">"./archive_logs"</span></div>
                                <div class="h-3"></div>
                                <div class="text-slate-500"># Build task automates logic</div>
                                <div>mkdir -p <span class="text-cyan-400">$OUT</span></div>
                                <div>cp -r <span class="text-cyan-400">$SRC_DIR</span>/*.log <span class="text-cyan-400">$OUT</span>/</div>
                                <div>echo <span class="text-emerald-400">"Archived server logs successfully!"</span></div>
                            </div>
                            <div class="bg-slate-900/30 p-3 border-t border-slate-900 text-[10px] text-slate-500 text-center font-mono">
                                Type script.sh to replace 15 lines of manual keyboard code.
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 2: ANATOMY - DYNAMIC INSPECTABLE -->
                <div id="slide-2" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 02</span><span>/</span><span>Inspector Guide</span>
                    </div>
                    <h2 class="text-2xl md:text-3xl font-extrabold text-slate-100 tracking-tight">Script Layout &amp; Anatomy</h2>
                    <p class="text-xs text-slate-400 leading-normal">
                        Click on the highlighted rows in the interactive file card below to inspect its purpose in the explanation pane.
                    </p>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Left Inspectable Script -->
                        <div class="lg:col-span-6 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between font-mono text-xs">
                            <div class="bg-slate-900 px-4 py-2.5 border-b border-slate-900 flex justify-between items-center text-[10px]">
                                <span class="text-slate-400">anatomy_inspector.sh</span>
                                <span class="text-amber-400 font-semibold"><i class="fa-solid fa-mouse-pointer"></i> Click rows to inspect</span>
                            </div>
                            
                            <div class="p-4 space-y-1.5 flex-grow">
                                <div onclick="inspectAnatomy('shebang', this)" class="p-2 rounded hover:bg-slate-900 cursor-pointer border border-transparent hover:border-slate-800 transition active-focus bg-slate-900 border-slate-800/80">
                                    <span class="text-rose-400">#!/bin/bash</span> <span class="text-slate-500"># Lines start like this</span>
                                </div>
                                <div onclick="inspectAnatomy('comments', this)" class="p-2 rounded hover:bg-slate-900 cursor-pointer border border-transparent hover:border-slate-800 transition">
                                    <span class="text-slate-500"># Initialize target backup and locations</span>
                                </div>
                                <div onclick="inspectAnatomy('variable', this)" class="p-2 rounded hover:bg-slate-900 cursor-pointer border border-transparent hover:border-slate-800 transition">
                                    <span class="text-purple-400">TARGET_STORE</span>=<span class="text-emerald-400">"/mnt/ssd/backups"</span>
                                </div>
                                <div onclick="inspectAnatomy('command', this)" class="p-2 rounded hover:bg-slate-900 cursor-pointer border border-transparent hover:border-slate-800 transition">
                                    <span class="text-cyan-400">mkdir</span> -p <span class="text-emerald-400">"$TARGET_STORE"</span>
                                </div>
                                <div onclick="inspectAnatomy('exit', this)" class="p-2 rounded hover:bg-slate-900 cursor-pointer border border-transparent hover:border-slate-800 transition">
                                    <span class="text-rose-400">exit</span> <span class="text-cyan-400">0</span>
                                </div>
                            </div>
                        </div>

                        <!-- Right Detail Pane -->
                        <div class="lg:col-span-6 flex flex-col justify-center">
                            <div id="anatomy-details-card" class="bg-slate-900/40 border border-slate-800 p-5 rounded-xl space-y-3">
                                <span class="text-[9px] bg-emerald-500/20 text-emerald-400 px-2.5 py-1 rounded font-mono font-bold uppercase tracking-wider">SHEBANG COMMAND</span>
                                <h3 class="text-sm font-bold text-slate-200">The Shebang Directive (#!/bin/bash)</h3>
                                <p class="text-xs text-slate-400 leading-relaxed">
                                    Always must sit on Line 1 of your script. The prefix <code class="text-emerald-300 font-mono">#!</code> instructs the kernel’s exec system that the rest of the lines in the file must be interpreted by the shell executable found at <code class="text-emerald-300 font-mono">/bin/bash</code>.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 3: VARIABLES AND SCOPE RULES -->
                <div id="slide-3" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 03</span><span>/</span><span>State Management</span>
                    </div>
                    <h2 class="text-2xl md:text-3xl font-extrabold text-slate-100 tracking-tight">Variables &amp; String Expansion</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-stretch">
                        <!-- Rules left side -->
                        <div class="space-y-4 text-xs md:text-sm text-slate-300 leading-relaxed">
                            <h3 class="font-bold text-slate-100 text-base">Key Rules of Variable Declaration:</h3>
                            <div class="space-y-3">
                                <div class="flex gap-2">
                                    <div class="text-rose-400 pt-0.5"><i class="fa-solid fa-circle-xmark text-sm"></i></div>
                                    <p><strong class="text-slate-200">No spacing!</strong> Code like <code class="text-rose-400 font-mono">NAME = "Alice"</code> fails. Bash interprets <code class="text-rose-400 font-mono">NAME</code> as an executable name, and <code class="text-rose-400">NAME=</code> is the parameters. Use <code class="text-emerald-400 font-mono">NAME="Alice"</code> directly.</p>
                                </div>
                                <div class="flex gap-2">
                                    <div class="text-amber-400 pt-0.5"><i class="fa-solid fa-quote-left text-sm"></i></div>
                                    <p><strong class="text-slate-200">Double vs Single Quotes:</strong> Single quotes preserve raw string characters. Double quotes resolve inline variables. Look below:</p>
                                </div>
                            </div>
                            
                            <div class="bg-slate-950 border border-slate-900 p-4 rounded-xl space-y-2.5 font-mono text-xs">
                                <div><span class="text-emerald-400">USER</span>="Gavin"</div>
                                <div><span class="text-cyan-400">echo</span> <span class="text-amber-300">"Welcome $USER"</span> <span class="text-slate-500"># Output: Welcome Gavin</span></div>
                                <div><span class="text-cyan-400">echo</span> <span class="text-amber-300">'Welcome $USER'</span> <span class="text-slate-500"># Output: Welcome $USER</span></div>
                            </div>
                        </div>

                        <!-- Command Line arguments presentation -->
                        <div class="bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between p-4 space-y-4">
                            <div>
                                <h3 class="font-bold text-xs text-slate-300 uppercase tracking-widest mb-2 flex items-center gap-1.5">
                                    <i class="fa-solid fa-calculator text-emerald-400"></i> Command Line Arguments
                                </h3>
                                <p class="text-xs text-slate-400">
                                    Access input arguments passed during call execution in sequential variables:
                                </p>
                            </div>
                            
                            <div class="grid grid-cols-4 gap-2 text-center text-[10px] font-mono">
                                <div class="bg-slate-900 p-2.5 rounded border border-slate-800">
                                    <div class="text-emerald-400 font-bold text-xs">$0</div>
                                    <div class="text-slate-500 mt-1 text-[9px]">Script Name</div>
                                </div>
                                <div class="bg-slate-900 p-2.5 rounded border border-slate-800">
                                    <div class="text-emerald-400 font-bold text-xs">$1</div>
                                    <div class="text-slate-500 mt-1 text-[9px]">First Arg</div>
                                </div>
                                <div class="bg-slate-900 p-2.5 rounded border border-slate-800">
                                    <div class="text-emerald-400 font-bold text-xs">$2</div>
                                    <div class="text-slate-500 mt-1 text-[9px]">Second Arg</div>
                                </div>
                                <div class="bg-slate-900 p-2.5 rounded border border-slate-800">
                                    <div class="text-emerald-400 font-bold text-xs">$#</div>
                                    <div class="text-slate-500 mt-1 text-[9px]">Arg Count</div>
                                </div>
                            </div>

                            <div class="bg-slate-900/60 p-3 rounded-xl border border-slate-800/60">
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">EXECUTION INPUT EXAMPLE:</span>
                                <code class="text-xs font-mono text-cyan-300 block bg-slate-950 p-2 rounded">./setup.sh "api_server" 8080</code>
                                <p class="text-[10px] text-slate-400 mt-1.5">
                                    Inside the script, <code class="text-emerald-400 font-mono">$1</code> evaluates to <code class="text-emerald-400 font-mono">"api_server"</code> and <code class="text-emerald-400 font-mono">$2</code> evaluates to <code class="text-emerald-400 font-mono">8080</code>.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 4: CONDITIONALS INTERACTIVE ENGINE -->
                <div id="slide-4" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 04</span><span>/</span><span>Evaluation Logic</span>
                    </div>
                    <h2 class="text-2xl md:text-3xl font-extrabold text-slate-100 tracking-tight">Conditionals: If / Else Logic</h2>
                    <p class="text-xs text-slate-400">
                        Modern Bash uses double brackets <code class="text-emerald-300 font-mono">[[ condition ]]</code> for safest boolean checking. Use this simulator to toggle states and see what evaluated logic runs.
                    </p>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Interactive Selector Controls -->
                        <div class="lg:col-span-5 bg-slate-950 border border-slate-900 rounded-xl p-4 flex flex-col justify-between space-y-4">
                            <div>
                                <h3 class="text-xs font-bold text-slate-300 uppercase tracking-widest mb-3">Toggle Simulation Input:</h3>
                                <div class="space-y-3 text-xs">
                                    <div class="flex items-center justify-between p-2.5 bg-slate-900/60 rounded-lg border border-slate-800/60">
                                        <span class="font-mono text-slate-300">USER_LEVEL (Integer)</span>
                                        <select id="sim-user-level" onchange="runConditionSimulation()" class="bg-slate-950 border border-slate-800 text-emerald-400 rounded px-2 py-1 focus:outline-none font-mono text-[11px]">
                                            <option value="5">5</option>
                                            <option value="15">15 (Admin Level)</option>
                                        </select>
                                    </div>
                                    <div class="flex items-center justify-between p-2.5 bg-slate-900/60 rounded-lg border border-slate-800/60">
                                        <span class="font-mono text-slate-300">File "deploy.conf" Exists</span>
                                        <select id="sim-file-exists" onchange="runConditionSimulation()" class="bg-slate-950 border border-slate-800 text-emerald-400 rounded px-2 py-1 focus:outline-none font-mono text-[11px]">
                                            <option value="true">YES (True)</option>
                                            <option value="false">NO (False)</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-slate-900/40 p-3 rounded-lg border border-slate-850/60 text-[10px] text-slate-400 space-y-1">
                                <span class="text-slate-200 font-bold uppercase text-[9px] tracking-wider block">Evaluator Insights:</span>
                                <p>• Double brackets <code class="text-emerald-300 font-mono">[[ ]]</code> prevent script crashes if string variables evaluate to empty values.</p>
                                <p>• Always leave spacing next to the brackets.</p>
                            </div>
                        </div>

                        <!-- Live Bash Logic Evaluator Output -->
                        <div class="lg:col-span-7 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col">
                            <div class="bg-slate-900 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400 flex items-center gap-1.5">
                                    <span class="w-2 h-2 rounded-full bg-emerald-400"></span> Live Bash Evaluator Output
                                </span>
                            </div>
                            
                            <!-- Dynamic Code block view -->
                            <div class="p-4 font-mono text-xs flex-grow flex flex-col justify-between">
                                <div class="space-y-1">
                                    <div><span class="text-slate-500"># Evaluating current states:</span></div>
                                    <div><span class="text-rose-400">if</span> <span class="text-cyan-300">[[</span> <span class="text-emerald-400">$USER_LEVEL</span> <span class="text-cyan-300">-gt 10 ]]</span>; <span class="text-rose-400">then</span></div>
                                    <div class="pl-4 text-slate-400 highlight-line" id="eval-branch-1">&nbsp;&nbsp;echo <span class="text-amber-300">"Access Level: Admin. Proceeding..."</span></div>
                                    <div><span class="text-rose-400">elif</span> <span class="text-cyan-300">[[</span> <span class="text-cyan-300">-f</span> <span class="text-emerald-400">"deploy.conf"</span> <span class="text-cyan-300">]]</span>; <span class="text-rose-400">then</span></div>
                                    <div class="pl-4 text-slate-400 highlight-line" id="eval-branch-2">&nbsp;&nbsp;echo <span class="text-amber-300">"Using alternative configuration..."</span></div>
                                    <div><span class="text-rose-400">else</span></div>
                                    <div class="pl-4 text-slate-400 highlight-line" id="eval-branch-3">&nbsp;&nbsp;echo <span class="text-amber-300">"Access Denied. Check credentials."</span></div>
                                    <div><span class="text-rose-400">fi</span></div>
                                </div>

                                <div class="mt-4 pt-3 border-t border-slate-900">
                                    <div class="text-[9px] text-slate-500 uppercase font-bold tracking-wider mb-1">Terminal Stdout Result:</div>
                                    <div id="sim-stdout" class="p-3 bg-slate-900 text-emerald-400 font-mono rounded text-xs border border-slate-850">
                                        <!-- Javascript output injected -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 5: STEPPING THROUGH LOOPS -->
                <div id="slide-5" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 05</span><span>/</span><span>Trace Mechanics</span>
                    </div>
                    <h2 class="text-2xl md:text-3xl font-extrabold text-slate-100 tracking-tight">Loops (For &amp; While)</h2>
                    <p class="text-xs text-slate-400">
                        Loops automate repeating processes over sequences of values. Click <strong>"Execute Step"</strong> to step through and see variables update in real time!
                    </p>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Left loop explanation -->
                        <div class="lg:col-span-5 space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between">
                            <div class="space-y-2.5">
                                <h3 class="font-bold text-slate-200">Looping Sequences</h3>
                                <p>
                                    A <strong class="text-emerald-400 font-semibold">for loop</strong> iterates over variables in a provided list (like an array or directory names).
                                </p>
                                <p>
                                    In Bash, <code class="text-emerald-300 font-mono">{1..3}</code> is an expansion shorthand that resolves to the numbers 1, 2, and 3.
                                </p>
                            </div>

                            <div class="bg-slate-950 border border-slate-900 p-4 rounded-xl space-y-3">
                                <div class="flex justify-between items-center text-xs">
                                    <span class="text-slate-400 font-bold uppercase text-[10px]">Tracer Variable State:</span>
                                    <span class="font-mono text-emerald-400 font-extrabold bg-emerald-500/10 border border-emerald-500/20 px-2 py-0.5 rounded" id="loop-tracer-state">i = NULL</span>
                                </div>
                                <div class="flex gap-2">
                                    <button onclick="stepThroughLoop()" class="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold text-[10px] uppercase tracking-wider px-3 py-1.5 rounded-lg flex items-center gap-1.5 transition">
                                        <i class="fa-solid fa-play"></i> Execute Step
                                    </button>
                                    <button onclick="resetLoopTracer()" class="bg-slate-900 hover:bg-slate-800 border border-slate-800 text-slate-300 text-[10px] uppercase tracking-wider px-3 py-1.5 rounded-lg transition">
                                        Reset Loop
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Step code block visualizer -->
                        <div class="lg:col-span-7 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between">
                            <div class="bg-slate-900 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400">loop_stepper_tracer.sh</span>
                                <span class="text-[9px] bg-slate-800 text-slate-400 px-2 py-0.5 rounded font-bold uppercase">Dynamic Debugger</span>
                            </div>
                            
                            <div class="p-4 font-mono text-xs space-y-1">
                                <div id="loop-line-0" class="p-1 rounded text-slate-500"># Iterating variable numbers</div>
                                <div id="loop-line-1" class="p-1 rounded"><span class="text-rose-400">for</span> <span class="text-cyan-400">i</span> <span class="text-rose-400">in</span> {1..3}; <span class="text-rose-400">do</span></div>
                                <div id="loop-line-2" class="p-1 rounded pl-4 text-slate-300">&nbsp;&nbsp;echo <span class="text-amber-300">"Connecting target node-$i"</span></div>
                                <div id="loop-line-3" class="p-1 rounded pl-4 text-slate-300">&nbsp;&nbsp;ping -c 1 <span class="text-emerald-400">"10.0.0.$i"</span></div>
                                <div id="loop-line-4" class="p-1 rounded"><span class="text-rose-400">done</span></div>
                            </div>

                            <div class="bg-slate-900/60 p-4 border-t border-slate-900">
                                <span class="text-[9px] text-slate-500 uppercase font-mono block mb-1">LOOP TRACE STDOUT:</span>
                                <div id="loop-stdout-pane" class="bg-slate-950 p-3 rounded font-mono text-xs text-emerald-400 h-28 overflow-y-auto border border-slate-900 flex flex-col gap-1">
                                    <span class="text-slate-600">[Debugger ready. Click Execute Step to start tracer]</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 6: MODULAR FUNCTIONS -->
                <div id="slide-6" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 06</span><span>/</span><span>Modular Design</span>
                    </div>
                    <h2 class="text-2xl md:text-3xl font-extrabold text-slate-100 tracking-tight">Code Reuse with Functions</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <div class="lg:col-span-6 space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between">
                            <div class="space-y-3 leading-relaxed">
                                <p>
                                    Functions allow you to compartmentalize blocks of operations. They can be invoked repeatedly across scripts with different parameters.
                                </p>
                                <p>
                                    <strong class="text-emerald-400 font-bold">Scope Warning:</strong> Variables in Bash are globally scoped by default. Use the <code class="text-cyan-400 font-mono">local</code> keyword inside a function to prevent it from altering variable values in the rest of your script!
                                </p>
                            </div>
                            
                            <div class="bg-slate-950 border border-slate-900 p-4 rounded-xl space-y-2 text-xs">
                                <h4 class="font-bold text-slate-200 text-xs flex items-center gap-1.5 uppercase">
                                    <i class="fa-solid fa-code text-emerald-400"></i> Function Call Syntax
                                </h4>
                                <p class="text-slate-400 text-[11px]">
                                    Invoke a function by typing its name followed by space-separated parameters. No parentheses needed during calls:
                                </p>
                                <code class="block bg-slate-900 p-2 rounded text-emerald-300 font-mono text-[11px] border border-slate-800">log_event "CRITICAL" "Lost network link"</code>
                            </div>
                        </div>

                        <!-- Code preview panel -->
                        <div class="lg:col-span-6 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col">
                            <div class="bg-slate-900 px-4 py-2.5 border-b border-slate-900 flex justify-between items-center text-[10px]">
                                <span class="text-slate-400">modular_scope.sh</span>
                                <span class="text-purple-400 font-semibold">Scope isolation demo</span>
                            </div>
                            
                            <div class="p-4 font-mono text-xs space-y-1.5 flex-grow">
                                <div class="text-slate-500"># Function Definition</div>
                                <div><span class="text-teal-400">validate_port()</span> {</div>
                                <div class="pl-4"><span class="text-rose-400">local</span> <span class="text-emerald-400">PORT</span>=<span class="text-amber-300">"$1"</span></div>
                                <div class="pl-4"><span class="text-rose-400">local</span> <span class="text-emerald-400">SVC</span>=<span class="text-amber-300">"$2"</span></div>
                                <div class="pl-4 text-cyan-400">echo <span class="text-amber-300">"Port $PORT is monitoring service: $SVC"</span></div>
                                <div>}</div>
                                <div class="h-2"></div>
                                <div class="text-slate-500"># Calling function with unique variables</div>
                                <div>validate_port <span class="text-emerald-400">80</span> <span class="text-emerald-400">"Nginx HTTP"</span></div>
                                <div>validate_port <span class="text-emerald-400">3306</span> <span class="text-emerald-400">"Database MySQL"</span></div>
                            </div>
                            
                            <div class="bg-slate-900/60 p-3 border-t border-slate-900 text-xs">
                                <span class="text-[9px] text-slate-500 uppercase font-mono block">Simulated STDOUT:</span>
                                <div class="bg-slate-950 p-2 rounded font-mono text-[10px] text-emerald-400 border border-slate-900">
                                    Port 80 is monitoring service: Nginx HTTP<br>
                                    Port 3306 is monitoring service: Database MySQL
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 7: HIGH END WORKSPACE AND VIRTUAL ENVIRONMENT -->
                <div id="slide-7" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 07</span><span>/</span><span>Interactive Terminal Sandbox</span>
                    </div>
                    <div class="flex flex-wrap items-center justify-between gap-2">
                        <h2 class="text-2xl font-extrabold text-slate-100 tracking-tight">Virtual Shell Workspace</h2>
                        <span class="text-[10px] bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 px-2.5 py-1 rounded font-bold uppercase tracking-wider">Fully Interactive</span>
                    </div>

                    <!-- Sandbox Layout Grid -->
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-5 items-stretch">
                        <!-- Left Controls and Code Editor Column -->
                        <div class="lg:col-span-6 flex flex-col space-y-3">
                            <!-- Preset load toolbar -->
                            <div class="flex flex-wrap items-center justify-between gap-2">
                                <span class="text-[10px] text-slate-400 font-bold uppercase tracking-wider">Load Preset:</span>
                                <div class="flex gap-1">
                                    <button onclick="loadWorkspacePreset('welcome')" class="bg-slate-900 hover:bg-slate-800 border border-slate-800 text-[10px] text-slate-300 font-mono px-2 py-1 rounded transition">welcome.sh</button>
                                    <button onclick="loadWorkspacePreset('system')" class="bg-slate-900 hover:bg-slate-800 border border-slate-800 text-[10px] text-slate-300 font-mono px-2 py-1 rounded transition">sys_test.sh</button>
                                    <button onclick="loadWorkspacePreset('backup')" class="bg-slate-900 hover:bg-slate-800 border border-slate-800 text-[10px] text-slate-300 font-mono px-2 py-1 rounded transition">backup.sh</button>
                                </div>
                            </div>

                            <!-- Custom Interactive code text area -->
                            <div class="bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col flex-grow">
                                <div class="bg-slate-900 px-4 py-2 border-b border-slate-900 flex justify-between items-center text-[10px]">
                                    <span class="text-slate-300 font-mono">script.sh</span>
                                    <span class="text-emerald-400 font-bold uppercase text-[9px]">Editable Source Code</span>
                                </div>
                                <textarea id="workspace-editor" class="w-full h-44 lg:h-56 p-3 bg-slate-950 font-mono text-xs text-emerald-300 focus:outline-none focus:ring-1 focus:ring-emerald-500/40 resize-y" placeholder="# Enter custom shell script lines here..."></textarea>
                            </div>

                            <div class="flex items-center gap-2">
                                <button onclick="executeWorkspaceScript()" class="glow-button bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-extrabold px-4 py-2.5 rounded-lg text-xs tracking-wider uppercase flex items-center gap-2 transition duration-200">
                                    <i class="fa-solid fa-play"></i> Run Script
                                </button>
                                <button onclick="clearWorkspaceTerminal()" class="bg-slate-900 hover:bg-slate-800 border border-slate-800 text-slate-300 font-bold px-4 py-2.5 rounded-lg text-xs tracking-wider uppercase transition">
                                    Clear Logs
                                </button>
                            </div>
                        </div>

                        <!-- Right Interactive Terminal Display Column -->
                        <div class="lg:col-span-6 flex flex-col space-y-3">
                            <!-- Virtual file viewer system -->
                            <div class="flex items-center justify-between">
                                <span class="text-[10px] text-slate-400 font-bold uppercase tracking-wider">Workspace Files (Click to inspect):</span>
                            </div>
                            
                            <div class="grid grid-cols-4 gap-2 text-center text-[10px] font-mono">
                                <button onclick="catWorkspaceFile('deploy.conf')" class="bg-slate-900 hover:bg-slate-800 border border-slate-850 p-2 rounded text-slate-300 flex flex-col items-center gap-1 transition">
                                    <i class="fa-solid fa-gears text-amber-500 text-xs"></i>
                                    <span class="truncate w-full text-[9px]">deploy.conf</span>
                                </button>
                                <button onclick="catWorkspaceFile('server.log')" class="bg-slate-900 hover:bg-slate-800 border border-slate-850 p-2 rounded text-slate-300 flex flex-col items-center gap-1 transition">
                                    <i class="fa-solid fa-file-invoice text-emerald-500 text-xs"></i>
                                    <span class="truncate w-full text-[9px]">server.log</span>
                                </button>
                                <button onclick="catWorkspaceFile('readme.md')" class="bg-slate-900 hover:bg-slate-800 border border-slate-850 p-2 rounded text-slate-300 flex flex-col items-center gap-1 transition">
                                    <i class="fa-solid fa-circle-info text-cyan-500 text-xs"></i>
                                    <span class="truncate w-full text-[9px]">readme.md</span>
                                </button>
                                <button onclick="catWorkspaceFile('backup.sh')" class="bg-slate-900 hover:bg-slate-800 border border-slate-850 p-2 rounded text-slate-300 flex flex-col items-center gap-1 transition">
                                    <i class="fa-solid fa-file-code text-purple-500 text-xs"></i>
                                    <span class="truncate w-full text-[9px]">backup.sh</span>
                                </button>
                            </div>

                            <!-- macOS Style Terminal Shell Output window -->
                            <div class="bg-zinc-950 border border-slate-900 rounded-xl overflow-hidden flex-grow flex flex-col min-h-[220px]">
                                <div class="bg-slate-900 px-4 py-2 border-b border-slate-900 flex justify-between items-center text-[10px]">
                                    <span class="text-slate-300 font-mono">virtual_terminal stdout</span>
                                    <div class="flex gap-1.5">
                                        <span class="w-2.5 h-2.5 rounded-full bg-red-500/80 inline-block"></span>
                                        <span class="w-2.5 h-2.5 rounded-full bg-yellow-500/80 inline-block"></span>
                                        <span class="w-2.5 h-2.5 rounded-full bg-emerald-500/80 inline-block"></span>
                                    </div>
                                </div>
                                <div id="workspace-stdout" class="p-4 font-mono text-xs text-emerald-400 space-y-1 overflow-y-auto max-h-56 lg:max-h-72 select-text flex-grow">
                                    <div class="text-slate-500">[System status: Simulated Shell Environment Ready]</div>
                                    <div class="text-slate-500">Press "Run Script" to run code, or click workspace files above to inspect files!</div>
                                    <div><span class="text-slate-500">sandbox@bash-academy:~$ </span><span class="terminal-cursor inline-block w-1.5 h-3.5 bg-emerald-400 align-middle"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 8: GAMIFIED KNOWLEDGE ARENA -->
                <div id="slide-8" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 08</span><span>/</span><span>Evaluation Chapter</span>
                    </div>
                    <div class="flex flex-wrap items-center justify-between gap-3">
                        <h2 class="text-2xl font-extrabold text-slate-100 tracking-tight">Interactive Knowledge Arena</h2>
                        <span class="text-xs font-bold text-emerald-400 bg-emerald-500/10 border border-emerald-500/30 px-3 py-1 rounded" id="quiz-score-badge">Total Score: 0/5</span>
                    </div>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Left Quiz Question Menu -->
                        <div class="lg:col-span-4 flex flex-row lg:flex-col gap-2 overflow-x-auto pb-2 lg:pb-0" id="quiz-nav-strip">
                            <!-- JS Injectable Navigation -->
                        </div>

                        <!-- Central Active Question View Panel -->
                        <div class="lg:col-span-8 bg-slate-950 border border-slate-900 rounded-xl p-5 md:p-6 flex flex-col justify-between space-y-5">
                            <div>
                                <div class="flex justify-between items-center pb-2 border-b border-slate-900">
                                    <span class="text-[9px] bg-emerald-500/20 text-emerald-300 px-2.5 py-1 rounded font-mono uppercase font-extrabold" id="quiz-question-lbl">Question 1</span>
                                    <span class="text-xs text-slate-500 font-mono">Multiple Choice</span>
                                </div>
                                
                                <h3 class="text-sm md:text-base font-bold text-slate-100 mt-3 leading-relaxed" id="quiz-question-txt">
                                    Loading quiz...
                                </h3>
                                
                                <div class="mt-4 space-y-2.5" id="quiz-options-strip">
                                    <!-- Dynamic Options injected here -->
                                </div>
                            </div>

                            <div class="mt-4 pt-3 border-t border-slate-900 text-xs flex flex-col md:flex-row justify-between items-start md:items-center gap-3">
                                <span id="quiz-feedback" class="text-slate-400 font-medium">Select an option above to submit your answer.</span>
                                <button onclick="nextQuizQuestion()" class="bg-slate-900 hover:bg-slate-800 border border-slate-800 text-slate-300 px-4 py-2 rounded-lg transition font-bold flex items-center gap-2 text-xs shrink-0 self-end md:self-auto" id="quiz-action-btn">
                                    Next Challenge <i class="fa-solid fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 9: LAB 1 (EASY) -->
                <div id="slide-9" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 09</span><span>/</span><span>Challenge 1 of 5</span>
                    </div>
                    <div class="flex justify-between items-center border-b border-slate-900 pb-2">
                        <h2 class="text-2xl font-extrabold text-slate-100">Lab 1: Interactive Profile Creator</h2>
                        <span class="text-[10px] bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 px-2.5 py-1 rounded font-mono font-bold uppercase tracking-wider">EASY</span>
                    </div>
                    <p class="text-xs text-slate-400">
                        Capture dynamic user interaction. Your script should prompt the user for their profile credentials and output a stylized access card.
                    </p>

                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-stretch mt-2">
                        <div class="space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-2.5">
                                <h3 class="font-bold text-slate-200">The Mission Goals:</h3>
                                <p>1. Prompt the active user with: <code class="text-cyan-400 font-mono">"Enter Profile Name: "</code>.</p>
                                <p>2. Prompt with: <code class="text-cyan-400 font-mono">"Enter System Role (e.g. SysAdmin, Dev): "</code>.</p>
                                <p>3. Generate a dynamic console output welcoming the user and listing their active system role privileges.</p>
                            </div>
                            <div class="bg-slate-900/60 p-3 rounded-xl border border-slate-850">
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">KEY CONCEPTS INVOLVED:</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; read command</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; Variable Expansion</span>
                            </div>
                        </div>

                        <div class="bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between p-4">
                            <div>
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">EXPECTED SHELL PREVIEW:</span>
                                <div class="bg-slate-900 p-4 rounded-lg border border-slate-850 font-mono text-xs space-y-2 text-slate-300">
                                    <div>Enter Profile Name: <span class="text-emerald-400">Gavin</span></div>
                                    <div>Enter System Role: <span class="text-emerald-400">Operator</span></div>
                                    <div class="text-slate-500">------------------------------------</div>
                                    <div class="text-amber-400 font-bold">ACCESS CARD ENCRYPTED:</div>
                                    <div>Host Profile: Gavin</div>
                                    <div>Privilege Level: Operator</div>
                                </div>
                            </div>
                            <button onclick="goToSlide(10)" class="bg-slate-900 hover:bg-slate-800 text-slate-200 py-2.5 rounded-lg text-xs font-bold border border-slate-800 transition text-center mt-3">
                                View Lab Hints &amp; Expert Solution <i class="fa-solid fa-chevron-right text-emerald-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 10: LAB 1 HINTS & SOLUTION -->
                <div id="slide-10" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-amber-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 10</span><span>/</span><span>Lab 1 Hints &amp; Code</span>
                    </div>
                    <h2 class="text-2xl font-extrabold text-slate-100">Lab 1: Clues &amp; Solution</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Clues pane -->
                        <div class="lg:col-span-5 space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-3">
                                <h3 class="font-bold text-amber-400">Clue Vault:</h3>
                                <p>• Use <code class="text-emerald-300 font-mono">read -p</code> to print a string prompt and catch the terminal response on the same line.</p>
                                <p>• Assign variables natively: <code class="text-emerald-300 font-mono">NAME=$RESPONSE</code>.</p>
                                <p>• Print output lines with variable interpolators wrapped inside double quotes to resolve state variables.</p>
                            </div>
                            <div class="bg-slate-900/40 p-3 rounded-lg border border-slate-800 text-[10px] text-slate-500 font-mono">
                                Copy the code on the right and paste it into the Sandbox (Chapter 7) to run instantly!
                            </div>
                        </div>

                        <!-- Solution code pane -->
                        <div class="lg:col-span-7 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between">
                            <div class="bg-slate-900 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400">lab_1_solution.sh</span>
                                <span class="text-[9px] bg-emerald-500/10 text-emerald-400 px-2 py-0.5 rounded font-bold uppercase">Verified Code</span>
                            </div>
                            
                            <!-- Hidden solution code placeholder state -->
                            <div id="lab-solution-placeholder-1" class="p-8 flex flex-col items-center justify-center text-center space-y-4 flex-grow min-h-[220px]">
                                <div class="w-14 h-14 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-400 border border-emerald-500/20 animate-pulse">
                                    <i class="fa-solid fa-lock text-xl"></i>
                                </div>
                                <div>
                                    <h4 class="text-xs font-bold text-slate-200 tracking-wider uppercase">Solution Code Encrypted</h4>
                                    <p class="text-[10px] text-slate-500 mt-1 max-w-xs leading-relaxed">Challenge yourself! Try building this solution yourself in the Virtual Workspace Sandbox first.</p>
                                </div>
                                <button onclick="revealLabSolution(1)" class="glow-button bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-extrabold px-4 py-2 rounded-lg text-[10px] tracking-wider uppercase flex items-center gap-1.5 transition">
                                    <i class="fa-solid fa-key"></i> Reveal Solution
                                </button>
                            </div>

                            <pre id="lab-solution-pre-1" class="p-4 font-mono text-[11px] text-emerald-400 overflow-x-auto space-y-1 hidden flex-grow">
#!/bin/bash
# Prompt input
read -p "Enter Profile Name: " USER_NAME
read -p "Enter System Role: " USER_ROLE

echo "------------------------------------"
echo "ACCESS CARD ENCRYPTED:"
echo "Host Profile: $USER_NAME"
echo "Privilege Level: $USER_ROLE"
                            </pre>
                            
                            <div class="p-3 bg-slate-900 border-t border-slate-900 flex justify-between">
                                <button onclick="goToSlide(7)" class="text-emerald-400 hover:text-emerald-300 font-bold font-mono text-xs">
                                    <i class="fa-solid fa-terminal"></i> Try in Sandbox
                                </button>
                                <button onclick="goToSlide(11)" class="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold px-3 py-1.5 rounded text-[11px] transition">
                                    Next Challenge <i class="fa-solid fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 11: LAB 2 (EASY-MEDIUM) -->
                <div id="slide-11" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 11</span><span>/</span><span>Challenge 2 of 5</span>
                    </div>
                    <div class="flex justify-between items-center border-b border-slate-900 pb-2">
                        <h2 class="text-2xl font-extrabold text-slate-100">Lab 2: Log Rotator &amp; Backup Archiver</h2>
                        <span class="text-[10px] bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 px-2.5 py-1 rounded font-mono font-bold uppercase tracking-wider">EASY-MEDIUM</span>
                    </div>
                    <p class="text-xs text-slate-400">
                        Create safe file directories defensively. Guard operations so errors do not halt program workflows.
                    </p>

                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-stretch mt-2">
                        <div class="space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-2.5">
                                <h3 class="font-bold text-slate-200">The Mission Goals:</h3>
                                <p>1. Check if a directory named <code class="text-emerald-300 font-mono">backups</code> exists in your system.</p>
                                <p>2. If the folder is missing, create it dynamically and print <code class="text-emerald-300 font-mono">"Creating backup folder..."</code>.</p>
                                <p>3. Generate a mockup log file named <code class="text-emerald-300 font-mono">server.log</code>, then safely move it into the backups folder.</p>
                            </div>
                            <div class="bg-slate-900/60 p-3 rounded-xl border border-slate-850">
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">KEY CONCEPTS INVOLVED:</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; Directory Checks [[ ! -d "backups" ]]</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; mkdir / touch / mv commands</span>
                            </div>
                        </div>

                        <div class="bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between p-4">
                            <div>
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">EXPECTED OUTPUT LOGIC:</span>
                                <div class="bg-slate-900 p-4 rounded-lg border border-slate-850 font-mono text-xs space-y-2 text-slate-300">
                                    <div class="text-yellow-400">[Checking logs storage path...]</div>
                                    <div>Folder missing. Creating directory: backups...</div>
                                    <div>Touch creating fresh log stream...</div>
                                    <div>Relocating server.log to backups/</div>
                                    <div class="text-emerald-400 font-bold">[Rotation complete!]</div>
                                </div>
                            </div>
                            <button onclick="goToSlide(12)" class="bg-slate-900 hover:bg-slate-800 text-slate-200 py-2.5 rounded-lg text-xs font-bold border border-slate-800 transition text-center mt-3">
                                View Lab Hints &amp; Expert Solution <i class="fa-solid fa-chevron-right text-emerald-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 12: LAB 2 HINTS & SOLUTION -->
                <div id="slide-12" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-amber-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 12</span><span>/</span><span>Lab 2 Hints &amp; Code</span>
                    </div>
                    <h2 class="text-2xl font-extrabold text-slate-100">Lab 2: Clues &amp; Solution</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Clues pane -->
                        <div class="lg:col-span-5 space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-3">
                                <h3 class="font-bold text-amber-400">Clue Vault:</h3>
                                <p>• Check directory presence with <code class="text-emerald-300 font-mono">-d "foldername"</code> inside evaluation brackets.</p>
                                <p>• Negate condition flags with <code class="text-emerald-300 font-mono">!</code> (Not) to verify folder absence.</p>
                                <p>• Close out the conditional check using the reverse indicator <code class="text-emerald-300 font-mono">fi</code>.</p>
                            </div>
                            <div class="bg-slate-900/40 p-3 rounded-lg border border-slate-800 text-[10px] text-slate-500 font-mono">
                                Practice writing clean indentation inside standard block conditionals for easier maintenance.
                            </div>
                        </div>

                        <!-- Solution code pane -->
                        <div class="lg:col-span-7 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between">
                            <div class="bg-slate-900 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400">lab_2_solution.sh</span>
                                <span class="text-[9px] bg-emerald-500/10 text-emerald-400 px-2 py-0.5 rounded font-bold uppercase">Verified Code</span>
                            </div>

                            <!-- Hidden solution code placeholder state -->
                            <div id="lab-solution-placeholder-2" class="p-8 flex flex-col items-center justify-center text-center space-y-4 flex-grow min-h-[220px]">
                                <div class="w-14 h-14 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-400 border border-emerald-500/20 animate-pulse">
                                    <i class="fa-solid fa-lock text-xl"></i>
                                </div>
                                <div>
                                    <h4 class="text-xs font-bold text-slate-200 tracking-wider uppercase">Solution Code Encrypted</h4>
                                    <p class="text-[10px] text-slate-500 mt-1 max-w-xs leading-relaxed">Challenge yourself! Try building this solution yourself in the Virtual Workspace Sandbox first.</p>
                                </div>
                                <button onclick="revealLabSolution(2)" class="glow-button bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-extrabold px-4 py-2 rounded-lg text-[10px] tracking-wider uppercase flex items-center gap-1.5 transition">
                                    <i class="fa-solid fa-key"></i> Reveal Solution
                                </button>
                            </div>

                            <pre id="lab-solution-pre-2" class="p-4 font-mono text-[11px] text-emerald-400 overflow-x-auto space-y-1 hidden flex-grow">
#!/bin/bash
BACKUP_DIR="backups"

# Check if directory is missing
if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "Folder missing. Creating directory: $BACKUP_DIR..."
    mkdir "$BACKUP_DIR"
fi

echo "Touch creating fresh log stream..."
touch server.log

echo "Relocating server.log to $BACKUP_DIR/"
mv server.log "$BACKUP_DIR/"

echo "[Rotation complete!]"
                            </pre>
                            
                            <div class="p-3 bg-slate-900 border-t border-slate-900 flex justify-between">
                                <button onclick="goToSlide(7)" class="text-emerald-400 hover:text-emerald-300 font-bold font-mono text-xs">
                                    <i class="fa-solid fa-terminal"></i> Try in Sandbox
                                </button>
                                <button onclick="goToSlide(13)" class="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold px-3 py-1.5 rounded text-[11px] transition">
                                    Next Challenge <i class="fa-solid fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 13: LAB 3 (MEDIUM) -->
                <div id="slide-13" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 13</span><span>/</span><span>Challenge 3 of 5</span>
                    </div>
                    <div class="flex justify-between items-center border-b border-slate-900 pb-2">
                        <h2 class="text-2xl font-extrabold text-slate-100">Lab 3: Network Port Health Sweep</h2>
                        <span class="text-[10px] bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 px-2.5 py-1 rounded font-mono font-bold uppercase tracking-wider">MEDIUM</span>
                    </div>
                    <p class="text-xs text-slate-400">
                        Use loop sequences to check multiple resources automatically. Learn to embed custom conditionals inside loops.
                    </p>

                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-stretch mt-2">
                        <div class="space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-2.5">
                                <h3 class="font-bold text-slate-200">The Mission Goals:</h3>
                                <p>1. Write a loop iterating over ports: <code class="text-emerald-300 font-mono">80 443 8080 9000</code>.</p>
                                <p>2. For each port scanned, print <code class="text-emerald-300 font-mono">"Scanning port [port]..."</code>.</p>
                                <p>3. If port is <code class="text-emerald-300 font-mono">8080</code>, print a special alarm output: <code class="text-rose-400 font-bold">"Port 8080: ALERT - CRITICAL INTERCEPTION"</code>.</p>
                            </div>
                            <div class="bg-slate-900/60 p-3 rounded-xl border border-slate-850">
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">KEY CONCEPTS INVOLVED:</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; For loops (for port in ...)</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; Nested if/else checks</span>
                            </div>
                        </div>

                        <div class="bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between p-4">
                            <div>
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">EXPECTED TERMINAL OUTPUT:</span>
                                <div class="bg-slate-900 p-4 rounded-lg border border-slate-850 font-mono text-xs space-y-1.5 text-slate-300">
                                    <div>Scanning port 80... OK</div>
                                    <div>Scanning port 443... OK</div>
                                    <div class="text-rose-400 font-bold">Scanning port 8080... ALERT: CRITICAL INTERCEPTION</div>
                                    <div>Scanning port 9000... OK</div>
                                </div>
                            </div>
                            <button onclick="goToSlide(14)" class="bg-slate-900 hover:bg-slate-800 text-slate-200 py-2.5 rounded-lg text-xs font-bold border border-slate-800 transition text-center mt-3">
                                View Lab Hints &amp; Expert Solution <i class="fa-solid fa-chevron-right text-emerald-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 14: LAB 3 HINTS & SOLUTION -->
                <div id="slide-14" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-amber-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 14</span><span>/</span><span>Lab 3 Hints &amp; Code</span>
                    </div>
                    <h2 class="text-2xl font-extrabold text-slate-100">Lab 3: Clues &amp; Solution</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Clues pane -->
                        <div class="lg:col-span-5 space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-3">
                                <h3 class="font-bold text-amber-400">Clue Vault:</h3>
                                <p>• Declare list loops directly like: <code class="text-emerald-300 font-mono">for port in 80 443 8080 9000; do</code>.</p>
                                <p>• Use the numerical operator <code class="text-emerald-300 font-mono">-eq</code> instead of <code class="text-emerald-300 font-mono">==</code> to evaluate numeric variables.</p>
                                <p>• Remember to close the iteration chain block with <code class="text-emerald-300 font-mono">done</code>.</p>
                            </div>
                            <div class="bg-slate-900/40 p-3 rounded-lg border border-slate-800 text-[10px] text-slate-500 font-mono">
                                In real-world environments, this template helps scan active network sockets to verify system connectivity.
                            </div>
                        </div>

                        <!-- Solution code pane -->
                        <div class="lg:col-span-7 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between">
                            <div class="bg-slate-900 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400">lab_3_solution.sh</span>
                                <span class="text-[9px] bg-emerald-500/10 text-emerald-400 px-2 py-0.5 rounded font-bold uppercase">Verified Code</span>
                            </div>

                            <!-- Hidden solution code placeholder state -->
                            <div id="lab-solution-placeholder-3" class="p-8 flex flex-col items-center justify-center text-center space-y-4 flex-grow min-h-[220px]">
                                <div class="w-14 h-14 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-400 border border-emerald-500/20 animate-pulse">
                                    <i class="fa-solid fa-lock text-xl"></i>
                                </div>
                                <div>
                                    <h4 class="text-xs font-bold text-slate-200 tracking-wider uppercase">Solution Code Encrypted</h4>
                                    <p class="text-[10px] text-slate-500 mt-1 max-w-xs leading-relaxed">Challenge yourself! Try building this solution yourself in the Virtual Workspace Sandbox first.</p>
                                </div>
                                <button onclick="revealLabSolution(3)" class="glow-button bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-extrabold px-4 py-2 rounded-lg text-[10px] tracking-wider uppercase flex items-center gap-1.5 transition">
                                    <i class="fa-solid fa-key"></i> Reveal Solution
                                </button>
                            </div>

                            <pre id="lab-solution-pre-3" class="p-4 font-mono text-[11px] text-emerald-400 overflow-x-auto space-y-1 hidden flex-grow">
#!/bin/bash

# Sweep through target ports
for port in 80 443 8080 9000; do
    if [[ $port -eq 8080 ]]; then
        echo "Scanning port $port... ALERT: CRITICAL INTERCEPTION"
    else
        echo "Scanning port $port... OK"
    fi
done
                            </pre>
                            
                            <div class="p-3 bg-slate-900 border-t border-slate-900 flex justify-between">
                                <button onclick="goToSlide(7)" class="text-emerald-400 hover:text-emerald-300 font-bold font-mono text-xs">
                                    <i class="fa-solid fa-terminal"></i> Try in Sandbox
                                </button>
                                <button onclick="goToSlide(15)" class="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold px-3 py-1.5 rounded text-[11px] transition">
                                    Next Challenge <i class="fa-solid fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 15: LAB 4 (MEDIUM-HARD) -->
                <div id="slide-15" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 15</span><span>/</span><span>Challenge 4 of 5</span>
                    </div>
                    <div class="flex justify-between items-center border-b border-slate-900 pb-2">
                        <h2 class="text-2xl font-extrabold text-slate-100">Lab 4: Log Parser &amp; Error Exporter</h2>
                        <span class="text-[10px] bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 px-2.5 py-1 rounded font-mono font-bold uppercase tracking-wider">MEDIUM-HARD</span>
                    </div>
                    <p class="text-xs text-slate-400">
                        Use pipes (`|`) and outputs to parse logs. Your script will search for errors and log the total count to a separate report file.
                    </p>

                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-stretch mt-2">
                        <div class="space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-2.5">
                                <h3 class="font-bold text-slate-200">The Mission Goals:</h3>
                                <p>1. Search inside the workspace file <code class="text-emerald-300 font-mono">server.log</code> for lines containing <code class="text-emerald-300 font-mono">"ERROR"</code>.</p>
                                <p>2. Extract the lines and write them directly into a file called <code class="text-emerald-300 font-mono">errors_found.txt</code> using redirection flags.</p>
                                <p>3. Count the total lines inside <code class="text-emerald-300 font-mono">errors_found.txt</code> and print the results to the terminal.</p>
                            </div>
                            <div class="bg-slate-900/60 p-3 rounded-xl border border-slate-850">
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">KEY CONCEPConcepts:</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; grep command for text filtering</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; wc -l for line counting</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; Redirection operator &gt;</span>
                            </div>
                        </div>

                        <div class="bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between p-4">
                            <div>
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">EXPECTED OUTPUT PREVIEW:</span>
                                <div class="bg-slate-900 p-4 rounded-lg border border-slate-850 font-mono text-xs space-y-2 text-slate-300">
                                    <div class="text-yellow-400">[Locating workspace server.log...]</div>
                                    <div>Extracting match logs to errors_found.txt...</div>
                                    <div class="text-emerald-300">Errors extracted: 1 found.</div>
                                    <div class="text-slate-500 mt-1"># content inside errors_found.txt:</div>
                                    <div class="text-red-400 bg-red-950/20 p-1.5 rounded border border-red-900/40 font-mono text-[11px]">[21:41:10] ERROR Port scan identified unauthorized sweep.</div>
                                </div>
                            </div>
                            <button onclick="goToSlide(16)" class="bg-slate-900 hover:bg-slate-800 text-slate-200 py-2.5 rounded-lg text-xs font-bold border border-slate-800 transition text-center mt-3">
                                View Lab Hints &amp; Expert Solution <i class="fa-solid fa-chevron-right text-emerald-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 16: LAB 4 HINTS & SOLUTION -->
                <div id="slide-16" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-amber-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 16</span><span>/</span><span>Lab 4 Hints &amp; Code</span>
                    </div>
                    <h2 class="text-2xl font-extrabold text-slate-100">Lab 4: Clues &amp; Solution</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Clues pane -->
                        <div class="lg:col-span-5 space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-3">
                                <h3 class="font-bold text-amber-400">Clue Vault:</h3>
                                <p>• Search files using grep like: <code class="text-emerald-300 font-mono">grep "SEARCH_TEXT" target_file</code>.</p>
                                <p>• Redirect matching outputs to a new file with: <code class="text-emerald-300 font-mono">grep "ERROR" server.log > errors_found.txt</code>.</p>
                                <p>• Save command outputs directly into variables using the subshell syntax: <code class="text-emerald-300 font-mono">COUNT=$(wc -l &lt; file)</code>.</p>
                            </div>
                            <div class="bg-slate-900/40 p-3 rounded-lg border border-slate-800 text-[10px] text-slate-500 font-mono">
                                Redirection overrides target contents. Use double arrows <code class="text-emerald-400 font-mono">&gt;&gt;</code> if you want to append logs without deleting existing content.
                            </div>
                        </div>

                        <!-- Solution code pane -->
                        <div class="lg:col-span-7 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between">
                            <div class="bg-slate-900 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400">lab_4_solution.sh</span>
                                <span class="text-[9px] bg-emerald-500/10 text-emerald-400 px-2 py-0.5 rounded font-bold uppercase">Verified Code</span>
                            </div>

                            <!-- Hidden solution code placeholder state -->
                            <div id="lab-solution-placeholder-4" class="p-8 flex flex-col items-center justify-center text-center space-y-4 flex-grow min-h-[220px]">
                                <div class="w-14 h-14 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-400 border border-emerald-500/20 animate-pulse">
                                    <i class="fa-solid fa-lock text-xl"></i>
                                </div>
                                <div>
                                    <h4 class="text-xs font-bold text-slate-200 tracking-wider uppercase">Solution Code Encrypted</h4>
                                    <p class="text-[10px] text-slate-500 mt-1 max-w-xs leading-relaxed">Challenge yourself! Try building this solution yourself in the Virtual Workspace Sandbox first.</p>
                                </div>
                                <button onclick="revealLabSolution(4)" class="glow-button bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-extrabold px-4 py-2 rounded-lg text-[10px] tracking-wider uppercase flex items-center gap-1.5 transition">
                                    <i class="fa-solid fa-key"></i> Reveal Solution
                                </button>
                            </div>

                            <pre id="lab-solution-pre-4" class="p-4 font-mono text-[11px] text-emerald-400 overflow-x-auto space-y-1 hidden flex-grow">
#!/bin/bash
echo "[Locating workspace server.log...]"

# Extract errors using redirection
grep "ERROR" server.log > errors_found.txt
echo "Extracting match logs to errors_found.txt..."

# Run count operations
ERROR_COUNT=$(wc -l < errors_found.txt)
echo "Errors extracted: $ERROR_COUNT found."
                            </pre>
                            
                            <div class="p-3 bg-slate-900 border-t border-slate-900 flex justify-between">
                                <button onclick="goToSlide(7)" class="text-emerald-400 hover:text-emerald-300 font-bold font-mono text-xs">
                                    <i class="fa-solid fa-terminal"></i> Try in Sandbox
                                </button>
                                <button onclick="goToSlide(17)" class="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold px-3 py-1.5 rounded text-[11px] transition">
                                    Next Challenge <i class="fa-solid fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 17: LAB 5 (HARD) -->
                <div id="slide-17" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-emerald-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 17</span><span>/</span><span>Challenge 5 of 5</span>
                    </div>
                    <div class="flex justify-between items-center border-b border-slate-900 pb-2">
                        <h2 class="text-2xl font-extrabold text-slate-100">Lab 5: CPU Resource Monitor Function</h2>
                        <span class="text-[10px] bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 px-2.5 py-1 rounded font-mono font-bold uppercase tracking-wider">HARD</span>
                    </div>
                    <p class="text-xs text-slate-400">
                        Build a reusable monitoring function. This function takes CPU usage as a parameter and alerts if it exceeds a critical threshold.
                    </p>

                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-stretch mt-2">
                        <div class="space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-2.5">
                                <h3 class="font-bold text-slate-200">The Mission Goals:</h3>
                                <p>1. Define a function called <code class="text-emerald-300 font-mono">check_cpu_health</code>.</p>
                                <p>2. Pass a dynamic integer percentage as an argument. Read this internally inside the function scope via positional parameter <code class="text-emerald-300 font-mono">$1</code>.</p>
                                <p>3. If CPU is <code class="text-emerald-300 font-mono">&gt; 80</code>, print <code class="text-rose-400 font-bold">"CRITICAL CPU STALL"</code>. If <code class="text-emerald-300 font-mono">&gt; 50</code>, print <code class="text-amber-400 font-bold">"WARNING: Elevating temperatures."</code>. Otherwise, print <code class="text-emerald-400">"OK"</code>.</p>
                            </div>
                            <div class="bg-slate-900/60 p-3 rounded-xl border border-slate-850">
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">KEY CONCEPTS INVOLVED:</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; Reusable Function Scope declarations</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; Positional input parameters ($1)</span>
                                <span class="text-emerald-400 font-mono text-[11px] block">&gt; Multi-branch (if, elif, else) numeric tests</span>
                            </div>
                        </div>

                        <div class="bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between p-4">
                            <div>
                                <span class="text-[9px] text-slate-500 font-mono block mb-1">EXPECTED SIMULATED FUNCTION CALLS:</span>
                                <div class="bg-slate-900 p-4 rounded-lg border border-slate-850 font-mono text-xs space-y-1.5 text-slate-300">
                                    <div>sandbox@bash-academy:~$ check_cpu_health 45</div>
                                    <div class="text-emerald-400">CPU Status: OK (45%)</div>
                                    <div class="mt-1">sandbox@bash-academy:~$ check_cpu_health 92</div>
                                    <div class="text-rose-400 font-bold">CPU Status: CRITICAL CPU STALL (92%)</div>
                                </div>
                            </div>
                            <button onclick="goToSlide(18)" class="bg-slate-900 hover:bg-slate-800 text-slate-200 py-2.5 rounded-lg text-xs font-bold border border-slate-800 transition text-center mt-3">
                                View Lab Hints &amp; Expert Solution <i class="fa-solid fa-chevron-right text-emerald-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- SLIDE 18: LAB 5 HINTS & SOLUTION -->
                <div id="slide-18" class="slide-frame slide-hidden flex-col space-y-4">
                    <div class="flex items-center gap-2 text-amber-400 font-mono text-[10px] tracking-widest uppercase font-bold">
                        <span>Chapter 18</span><span>/</span><span>Lab 5 Hints &amp; Code</span>
                    </div>
                    <h2 class="text-2xl font-extrabold text-slate-100">Lab 5: Clues &amp; Solution</h2>
                    
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
                        <!-- Clues pane -->
                        <div class="lg:col-span-5 space-y-4 text-xs md:text-sm text-slate-300 flex flex-col justify-between bg-slate-950/40 p-5 rounded-xl border border-slate-900">
                            <div class="space-y-3">
                                <h3 class="font-bold text-amber-400">Clue Vault:</h3>
                                <p>• Define functions with: <code class="text-emerald-300 font-mono">my_function() { ... }</code>.</p>
                                <p>• Read input variables safely within the scope with <code class="text-emerald-300 font-mono">local CPU=$1</code>.</p>
                                <p>• Use numerical operators <code class="text-emerald-300 font-mono">-gt</code> (greater than) inside brackets to verify thresholds.</p>
                            </div>
                            <div class="bg-slate-900/40 p-3 rounded-lg border border-slate-800 text-[10px] text-slate-500 font-mono">
                                Use functions to modularize complex scripts. This allows you to call operations multiple times without writing duplicate code.
                            </div>
                        </div>

                        <!-- Solution code pane -->
                        <div class="lg:col-span-7 bg-slate-950 border border-slate-900 rounded-xl overflow-hidden flex flex-col justify-between">
                            <div class="bg-slate-900 px-4 py-2 flex items-center justify-between border-b border-slate-900">
                                <span class="text-[10px] font-mono text-slate-400">lab_5_solution.sh</span>
                                <span class="text-[9px] bg-emerald-500/10 text-emerald-400 px-2.5 py-0.5 rounded font-bold uppercase">Verified Code</span>
                            </div>

                            <!-- Hidden solution code placeholder state -->
                            <div id="lab-solution-placeholder-5" class="p-8 flex flex-col items-center justify-center text-center space-y-4 flex-grow min-h-[220px]">
                                <div class="w-14 h-14 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-400 border border-emerald-500/20 animate-pulse">
                                    <i class="fa-solid fa-lock text-xl"></i>
                                </div>
                                <div>
                                    <h4 class="text-xs font-bold text-slate-200 tracking-wider uppercase">Solution Code Encrypted</h4>
                                    <p class="text-[10px] text-slate-500 mt-1 max-w-xs leading-relaxed">Challenge yourself! Try building this solution yourself in the Virtual Workspace Sandbox first.</p>
                                </div>
                                <button onclick="revealLabSolution(5)" class="glow-button bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-extrabold px-4 py-2 rounded-lg text-[10px] tracking-wider uppercase flex items-center gap-1.5 transition">
                                    <i class="fa-solid fa-key"></i> Reveal Solution
                                </button>
                            </div>

                            <pre id="lab-solution-pre-5" class="p-4 font-mono text-[11px] text-emerald-400 overflow-x-auto space-y-1 hidden flex-grow">
#!/bin/bash

# Function definition
check_cpu_health() {
    local CPU_PCT=$1
    if [[ $CPU_PCT -gt 80 ]]; then
        echo "CPU Status: CRITICAL CPU STALL ($CPU_PCT%)"
    elif [[ $CPU_PCT -gt 50 ]]; then
        echo "CPU Status: WARNING ($CPU_PCT%)"
    else
        echo "CPU Status: OK ($CPU_PCT%)"
    fi
}

# Invoke the function multiple times
check_cpu_health 45
check_cpu_health 65
check_cpu_health 92
                            </pre>
                            
                            <div class="p-3 bg-slate-900 border-t border-slate-900 flex justify-between">
                                <button onclick="goToSlide(7)" class="text-emerald-400 hover:text-emerald-300 font-bold font-mono text-xs">
                                    <i class="fa-solid fa-terminal"></i> Try in Sandbox
                                </button>
                                <button onclick="goToSlide(0)" class="bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold px-3 py-1.5 rounded text-[11px] transition">
                                    Return to Intro <i class="fa-solid fa-rotate-left"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- FOOTER REMOTE PRESENTATION BAR -->
            <footer class="mt-8 border-t border-slate-900/80 pt-5 flex flex-col md:flex-row items-center justify-between gap-4">
                
                <!-- Slide remote control trigger buttons -->
                <div class="flex items-center gap-3 order-2 md:order-1">
                    <button onclick="previousSlide()" class="w-10 h-10 rounded-xl bg-slate-900 hover:bg-slate-800 border border-slate-800 text-slate-300 flex items-center justify-center transition-all duration-200 hover:scale-105" title="Previous Slide">
                        <i class="fa-solid fa-arrow-left"></i>
                    </button>
                    <!-- Dot indices map indicator list -->
                    <div class="flex items-center gap-1.5 px-2 overflow-x-auto max-w-[200px] md:max-w-none" id="navigation-dots">
                        <!-- Javascript will inject slide dot nodes here -->
                    </div>
                    <button onclick="nextSlide()" class="w-10 h-10 rounded-xl bg-slate-900 hover:bg-slate-800 border border-slate-800 text-slate-300 flex items-center justify-center transition-all duration-200 hover:scale-105" title="Next Slide">
                        <i class="fa-solid fa-arrow-right"></i>
                    </button>
                </div>

                <!-- Slide location progress metrics -->
                <div class="text-[10px] font-mono text-slate-500 uppercase tracking-widest order-1 md:order-2" id="slide-progress-count">
                    Slide 1 of 19
                </div>
            </footer>

        </div>
    </main>

    <!-- FOOTER COPYRIGHT STATUS BAR -->
    <footer class="border-t border-slate-900 bg-slate-950/40 py-4 text-center text-[10px] font-mono text-slate-600 tracking-wider">
        CORE BASH TRAINING MODULE • BUILT IN 2026 FOR HIGH CONSOLE FLUENCY
    </footer>

    <!-- INTERACTIVE JAVASCRIPT SYSTEM ENGINE -->
    <script>
        // Core Presentations slide indexes (updated to 19 total slides)
        const slideshowChapters = [
            { id: 'slide-0', title: 'Start Academy' },
            { id: 'slide-1', title: 'What is Bash?' },
            { id: 'slide-2', title: 'Script Anatomy' },
            { id: 'slide-3', title: 'Variables & Scope' },
            { id: 'slide-4', title: 'If / Else Logic' },
            { id: 'slide-5', title: 'Iterative Loops' },
            { id: 'slide-6', title: 'Custom Functions' },
            { id: 'slide-7', title: 'Workspace Sandbox' },
            { id: 'slide-8', title: 'Comprehension Quiz' },
            { id: 'slide-9', title: 'Lab 1: Personal Profile' },
            { id: 'slide-10', title: 'Lab 1 Hints & Answer' },
            { id: 'slide-11', title: 'Lab 2: Log Rotator' },
            { id: 'slide-12', title: 'Lab 2 Hints & Answer' },
            { id: 'slide-13', title: 'Lab 3: Port Sweeper' },
            { id: 'slide-14', title: 'Lab 3 Hints & Answer' },
            { id: 'slide-15', title: 'Lab 4: Log Parser' },
            { id: 'slide-16', title: 'Lab 4 Hints & Answer' },
            { id: 'slide-17', title: 'Lab 5: Resource Monitor' },
            { id: 'slide-18', title: 'Lab 5 Hints & Answer' }
        ];

        let activeSlideIndex = 0;

        // Custom script samples
        const workspacePresets = {
            welcome: `#!/bin/bash
# Welcome script for new devs
DEV_NAME="Junior Architect"
echo "Initializing console credentials..."
echo "Welcome to the terminal, $DEV_NAME!"
echo "System host location: $HOSTNAME"`,

            system: `#!/bin/bash
# Host memory and config status
echo "Checking directory space..."
ls -l
echo "Checking log state flags..."
if [[ -f "server.log" ]]; then
    echo "Found active log file stream."
fi`,

            backup: `#!/bin/bash
# Backup logs to deployments
BACKUP_DIR="deployments"
echo "Creating folder directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
cp server.log "$BACKUP_DIR/"
echo "Database archive script done."`
        };

        // Simulated workspace directory files
        const workspaceFiles = {
            'deploy.conf': `# Deployment Configurations
HOST="10.0.0.45"
PORT=8080
MAX_RETRIES=5
DEBUG=true`,
            'server.log': `[21:40:01] INFO  System boot sequence initialized.
[21:40:05] WARN  Port 8080 is monitoring external traffic.
[21:41:10] ERROR Port scan identified unauthorized sweep.`,
            'readme.md': `# Bash Academy Workspace Files
This virtual terminal simulates a bash execution loop.
Feel free to read existing files or create custom script variables!`,
            'backup.sh': `#!/bin/bash
# Simple task backup routine
echo "Triggering file replication tasks..."
cp -r deployments/ /var/log/backup/`
        };

        // Gamified quiz collection
        const quizCollection = [
            {
                question: "What is the primary purpose of the Shebang (#!/bin/bash) on line 1 of a script?",
                options: [
                    "It comments out the code to prevent compilation processes.",
                    "It instructs the OS to parse the file using the Bash executable found in /bin/bash.",
                    "It requests superuser permission levels from the operating system.",
                    "It imports basic standard libraries for numeric math parsing."
                ],
                correct: 1,
                explanation: "The Shebang instructs the system kernel which interpreter to use when reading and executing the script files."
            },
            {
                question: "Which code shows the correct spacing to define a variable in Bash without error?",
                options: [
                    "USER_NAME = 'Dev'",
                    "var USER_NAME = 'Dev'",
                    "USER_NAME='Dev'",
                    "set USER_NAME = 'Dev'"
                ],
                correct: 2,
                explanation: "No spaces must sit around the equal symbol in Bash variable assignments. Otherwise, the shell parses the variable as a command."
            },
            {
                question: "How do you capture the first parameter input passed to a command line script?",
                options: [
                    "$arg1",
                    "$1",
                    "$[0]",
                    "$first"
                ],
                correct: 1,
                explanation: "$1 refers to the first positional argument. $0 represents the path name of the running script file."
            },
            {
                question: "Which token must conclude every standard 'if' logical block in a Bash script?",
                options: [
                    "endif",
                    "end",
                    "fi",
                    "stop"
                ],
                correct: 2,
                explanation: "'fi' is the word 'if' reversed, signaling the closing edge of a conditional block in Bash script structural layouts."
            },
            {
                question: "Which command lets you change permissions to make your script runnable?",
                options: [
                    "chmod +x script.sh",
                    "chmod +r script.sh",
                    "chown root script.sh",
                    "deploy --enable script.sh"
                ],
                correct: 0,
                explanation: "'chmod +x' grants execution capabilities to files, allowing execution through command entries like ./script.sh"
            }
        ];

        let quizUserAnswers = Array(quizCollection.length).fill(null);
        let activeQuizIndex = 0;

        // Script anatomy text descriptions
        const anatomyTexts = {
            shebang: {
                badge: "SHEBANG DIRECTIVE",
                title: "The Shebang Line (#!/bin/bash)",
                text: "Must sit on Line 1. The prefix tells the operating system to pass this text file directly to the Bash binary interpreter program located in the bin system folder."
            },
            comments: {
                badge: "COMMENT STRUCTURE",
                title: "Inline Script Comments",
                text: "Lines beginning with '#' (excluding the shebang line) are ignored by the shell parser. Use comments to document your deployment architectures and variable states."
            },
            variable: {
                badge: "VARIABLE MAPPING",
                title: "Variable Assignments",
                text: "Define keys directly with values using '=' with no spaces. Wrapping values in double quotes enables expansion when prefixed with a dollar sign later."
            },
            command: {
                badge: "SYSTEM EXECUTABLE",
                title: "Command Directives",
                text: "Runs built-in system tools like 'mkdir' or 'cp'. Variables are expanded here to run the commands dynamically."
            },
            exit: {
                badge: "EXIT CODE STATUS",
                title: "Exit Code Return",
                text: "Returns status indicator indexes back to the parent process. An exit code of 0 means the script completed successfully without errors."
            }
        };

        // Initialization routine
        window.onload = function() {
            renderChaptersIndex();
            renderDotIndicators();
            updateSlideshowView();
            
            // Set first workspace preset
            loadWorkspacePreset('welcome');

            // Render quiz setup
            renderQuizNavigator();
            renderQuizQuestion(0);

            // Setup real condition evaluator on slide 4
            runConditionSimulation();

            // Setup event listeners for keyboard presentation navigation
            document.addEventListener('keydown', handleGlobalKeydown);
        };

        function handleGlobalKeydown(e) {
            // Disable slide changing if user is focused inside terminal editor
            if (document.activeElement.id === 'workspace-editor') {
                return;
            }
            if (e.key === 'ArrowRight' || e.key === 'Space') {
                nextSlide();
            } else if (e.key === 'ArrowLeft') {
                previousSlide();
            }
        }

        // Render Sidebar List
        function renderChaptersIndex() {
            const list = document.getElementById('slide-index-list');
            list.innerHTML = '';

            slideshowChapters.forEach((chap, idx) => {
                const btn = document.createElement('button');
                btn.id = `sidebar-btn-${idx}`;
                btn.className = "w-full text-left px-3 py-1.5 rounded-xl text-xs font-medium font-mono flex items-center justify-between transition border border-transparent";
                btn.innerHTML = `
                    <span class="flex items-center gap-2.5 truncate">
                        <span class="text-emerald-500 font-bold font-mono">${idx.toString().padStart(2, '0')}</span>
                        <span class="text-slate-300 font-sans truncate">${chap.title}</span>
                    </span>
                    <i class="fa-solid fa-chevron-right text-[8px] text-slate-600"></i>
                `;
                btn.onclick = () => {
                    goToSlide(idx);
                };
                list.appendChild(btn);
            });
        }

        // Render Dots Map Remote
        function renderDotIndicators() {
            const container = document.getElementById('navigation-dots');
            container.innerHTML = '';

            slideshowChapters.forEach((_, idx) => {
                const dot = document.createElement('button');
                dot.id = `nav-dot-${idx}`;
                dot.className = "w-2.5 h-2.5 rounded-full bg-slate-800 border border-slate-700 hover:bg-emerald-400 transition-all duration-200 shrink-0";
                dot.onclick = () => goToSlide(idx);
                dot.title = `Skip to chapter ${idx + 1}`;
                container.appendChild(dot);
            });
        }

        // Navigation update controller
        function updateSlideshowView() {
            // Re-hide solutions when slide updates so they remain protected/hidden initially
            resetLabSolutions();

            slideshowChapters.forEach((chap, idx) => {
                const frame = document.getElementById(chap.id);
                const sidebarBtn = document.getElementById(`sidebar-btn-${idx}`);
                const dot = document.getElementById(`nav-dot-${idx}`);

                if (idx === activeSlideIndex) {
                    frame.classList.remove('slide-hidden');
                    frame.classList.add('slide-active');

                    if (sidebarBtn) {
                        sidebarBtn.className = "w-full text-left px-3 py-1.5 rounded-xl text-xs font-medium font-mono flex items-center justify-between bg-slate-900 border-slate-800 text-emerald-400";
                    }
                    if (dot) {
                        dot.className = "w-5 h-2.5 rounded-full bg-emerald-500 border border-emerald-400 transition-all duration-200 shrink-0";
                    }
                } else {
                    frame.classList.add('slide-hidden');
                    frame.classList.remove('slide-active');

                    if (sidebarBtn) {
                        sidebarBtn.className = "w-full text-left px-3 py-1.5 rounded-xl text-xs font-medium font-mono flex items-center justify-between text-slate-500 hover:text-slate-300 transition border border-transparent";
                    }
                    if (dot) {
                        dot.className = "w-2.5 h-2.5 rounded-full bg-slate-800 border border-slate-700 hover:bg-emerald-400 transition-all duration-200 shrink-0";
                    }
                }
            });

            document.getElementById('slide-progress-count').innerText = `Chapter ${activeSlideIndex + 1} of ${slideshowChapters.length}`;
        }

        function nextSlide() {
            if (activeSlideIndex < slideshowChapters.length - 1) {
                activeSlideIndex++;
                updateSlideshowView();
            }
        }

        function previousSlide() {
            if (activeSlideIndex > 0) {
                activeSlideIndex--;
                updateSlideshowView();
            }
        }

        function goToSlide(idx) {
            if (idx >= 0 && idx < slideshowChapters.length) {
                activeSlideIndex = idx;
                updateSlideshowView();
            }
        }

        // Toggle UI panels
        function toggleSidebar() {
            const sb = document.getElementById('sidebar');
            if (sb.classList.contains('lg:block')) {
                sb.classList.remove('lg:block');
                sb.classList.add('translate-x-0');
            }
            if (sb.classList.contains('-translate-x-full')) {
                sb.classList.remove('-translate-x-full');
                sb.classList.add('translate-x-0');
            } else {
                sb.classList.add('-translate-x-full');
                sb.classList.remove('translate-x-0');
            }
        }

        function toggleCheatSheet() {
            const cs = document.getElementById('cheatsheet');
            if (cs.classList.contains('hidden')) {
                cs.classList.remove('hidden');
                cs.classList.remove('translate-x-full');
                cs.classList.add('translate-x-0');
            } else {
                cs.classList.add('translate-x-full');
                cs.classList.remove('translate-x-0');
                setTimeout(() => cs.classList.add('hidden'), 300);
            }
        }

        function toggleFullScreen() {
            if (!document.fullscreenElement) {
                document.documentElement.requestFullscreen().catch(err => {
                    console.warn(`Fullscreen activation failed: ${err.message}`);
                });
            } else {
                document.exitFullscreen();
            }
        }

        /* ---- INSPECTOR SCRIPT HANDLERS ---- */
        function inspectAnatomy(key, element) {
            // Clear current active styling on rows
            const rows = element.parentNode.children;
            for (let r of rows) {
                r.className = "p-2 rounded hover:bg-slate-900 cursor-pointer border border-transparent hover:border-slate-800 transition";
            }
            // Highlight selected row
            element.className = "p-2 rounded bg-slate-900 border border-slate-800 text-emerald-300 font-bold transition";

            // Update details pane on screen
            const target = anatomyTexts[key];
            const pane = document.getElementById('anatomy-details-card');
            
            pane.className = "bg-slate-900/40 border border-emerald-500/20 p-5 rounded-xl space-y-3 live-pulse transition duration-300";
            pane.innerHTML = `
                <span class="text-[9px] bg-emerald-500/20 text-emerald-400 px-2.5 py-1 rounded font-mono font-extrabold uppercase tracking-wider">${target.badge}</span>
                <h3 class="text-sm font-bold text-slate-100">${target.title}</h3>
                <p class="text-xs text-slate-400 leading-relaxed">${target.text}</p>
            `;
            setTimeout(() => {
                pane.classList.remove('live-pulse');
            }, 1000);
        }

        /* ---- CONDITION SIMULATION ENGINE ---- */
        function runConditionSimulation() {
            const level = parseInt(document.getElementById('sim-user-level').value);
            const fileExists = document.getElementById('sim-file-exists').value === 'true';

            // Reset dynamic text highlight overlays
            document.getElementById('eval-branch-1').className = "pl-4 text-slate-500 highlight-line";
            document.getElementById('eval-branch-2').className = "pl-4 text-slate-500 highlight-line";
            document.getElementById('eval-branch-3').className = "pl-4 text-slate-500 highlight-line";

            const stdout = document.getElementById('sim-stdout');

            if (level > 10) {
                document.getElementById('eval-branch-1').className = "pl-4 text-emerald-400 bg-emerald-500/10 border-l-2 border-emerald-500 font-bold py-1";
                stdout.innerHTML = `Access Level: Admin. Proceeding...`;
            } else if (fileExists) {
                document.getElementById('eval-branch-2').className = "pl-4 text-cyan-400 bg-cyan-500/10 border-l-2 border-cyan-500 font-bold py-1";
                stdout.innerHTML = `Using alternative configuration...`;
            } else {
                document.getElementById('eval-branch-3').className = "pl-4 text-rose-400 bg-rose-500/10 border-l-2 border-rose-500 font-bold py-1";
                stdout.innerHTML = `Access Denied. Check credentials.`;
            }
        }

        /* ---- INTERACTIVE LOOP STEPPING ENGINE ---- */
        let loopStepCount = 0;
        function resetLoopTracer() {
            loopStepCount = 0;
            document.getElementById('loop-stdout-pane').innerHTML = `<span class="text-slate-600">[Debugger ready. Click Execute Step to start tracer]</span>`;
            document.getElementById('loop-tracer-state').innerText = "i = NULL";
            clearLoopLinesHighlight();
        }

        function clearLoopLinesHighlight() {
            for (let idx = 0; idx <= 4; idx++) {
                document.getElementById(`loop-line-${idx}`).className = "p-1 rounded text-slate-300";
            }
            document.getElementById('loop-line-0').className = "p-1 rounded text-slate-500";
        }

        function stepThroughLoop() {
            const tracer = document.getElementById('loop-tracer-state');
            const term = document.getElementById('loop-stdout-pane');

            if (loopStepCount === 0) {
                term.innerHTML = '';
            }

            clearLoopLinesHighlight();

            // Sequence map
            const sequenceIndex = loopStepCount % 6;
            const iterationIndex = Math.floor(loopStepCount / 2) + 1;

            if (iterationIndex > 3) {
                term.innerHTML += `<div class="text-slate-500 mt-2">[Loop execution ended. Resetting...]</div>`;
                resetLoopTracer();
                return;
            }

            if (sequenceIndex === 0) {
                // Iteration start
                document.getElementById('loop-line-1').className = "p-1 rounded bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 font-bold";
                tracer.innerText = `i = ${iterationIndex}`;
                term.innerHTML += `<div class="text-slate-500">[Entering iteration i=${iterationIndex}]</div>`;
                loopStepCount++;
            } else if (sequenceIndex === 1) {
                // Echo command run
                document.getElementById('loop-line-2').className = "p-1 rounded bg-cyan-500/10 text-cyan-400 border border-cyan-500/20 font-bold";
                term.innerHTML += `<div>Connecting target node-${iterationIndex}</div>`;
                loopStepCount++;
            } else {
                // Ping output
                document.getElementById('loop-line-3').className = "p-1 rounded bg-purple-500/10 text-purple-400 border border-purple-500/20 font-bold";
                term.innerHTML += `<div class="text-[10px] text-cyan-300">PING 10.0.0.${iterationIndex} ... 64 bytes received</div>`;
                loopStepCount = Math.floor(loopStepCount / 2) * 2 + 2; // jump forward securely
            }
            term.scrollTop = term.scrollHeight;
        }

        /* ---- WORKSPACE HANDLERS & SIMULATED RUNS ---- */
        function loadWorkspacePreset(key) {
            if (workspacePresets[key]) {
                document.getElementById('workspace-editor').value = workspacePresets[key];
                const stdout = document.getElementById('workspace-stdout');
                stdout.innerHTML = `<div class="text-slate-500">[Workspace loaded script sample: ${key}.sh]</div>`;
            }
        }

        function clearWorkspaceTerminal() {
            document.getElementById('workspace-stdout').innerHTML = `
                <div><span class="text-slate-500">sandbox@bash-academy:~$ </span><span class="terminal-cursor inline-block w-1.5 h-3.5 bg-emerald-400 align-middle"></span></div>
            `;
        }

        function catWorkspaceFile(filename) {
            const data = workspaceFiles[filename] || "File empty or directory error.";
            const stdout = document.getElementById('workspace-stdout');
            stdout.innerHTML += `
                <div class="text-slate-300 mt-2">sandbox@bash-academy:~$ cat ${filename}</div>
                <pre class="bg-slate-950 p-3 rounded text-amber-300 font-mono text-[11px] border border-slate-900 mt-1 overflow-x-auto">${escapeHtml(data)}</pre>
            `;
            stdout.scrollTop = stdout.scrollHeight;
        }

        function executeWorkspaceScript() {
            const raw = document.getElementById('workspace-editor').value;
            const stdout = document.getElementById('workspace-stdout');

            stdout.innerHTML += `<div class="text-slate-500 mt-2">sandbox@bash-academy:~$ ./script.sh</div>`;

            const lines = raw.split('\n');
            const scopeVariables = {
                'HOSTNAME': 'sandbox-node-04'
            };

            let index = 0;
            function runNextLine() {
                if (index >= lines.length) {
                    stdout.innerHTML += `<div class="text-slate-500">[Process finished. Exit Code 0]</div>`;
                    stdout.scrollTop = stdout.scrollHeight;
                    return;
                }

                let line = lines[index].trim();
                index++;

                if (line === '' || (line.startsWith('#') && !line.startsWith('#!'))) {
                    runNextLine();
                    return;
                }

                // Variable resolutions
                line = line.replace(/\$([a-zA-Z_][a-zA-Z0-9_]*)/g, (match, key) => {
                    return scopeVariables[key] !== undefined ? scopeVariables[key] : '';
                });

                // Spacing validation check
                const variableAssignMatch = line.match(/^([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*(.*)$/);
                if (variableAssignMatch && !line.startsWith('echo') && !line.startsWith('if') && !line.startsWith('for')) {
                    // check if user mistakenly left spaces
                    const rawAssign = line.split('=');
                    if (rawAssign[0].includes(' ') || rawAssign[1].startsWith(' ')) {
                        stdout.innerHTML += `<div class="text-rose-400 font-bold">[Error: Assignment space mismatch on line ${index}]</div>`;
                        stdout.innerHTML += `<div class="text-rose-300">Bash syntax prohibits spaces around '=' assignment markers!</div>`;
                    } else {
                        let val = variableAssignMatch[2].trim();
                        if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) {
                            val = val.substring(1, val.length - 1);
                        }
                        scopeVariables[variableAssignMatch[1]] = val;
                    }
                    runNextLine();
                    return;
                }

                // Simple commands simulation
                if (line.startsWith('echo ')) {
                    let out = line.substring(5).trim();
                    if ((out.startsWith('"') && out.endsWith('"')) || (out.startsWith("'") && out.endsWith("'"))) {
                        out = out.substring(1, out.length - 1);
                    }
                    stdout.innerHTML += `<div class="text-slate-100">${escapeHtml(out)}</div>`;
                } else if (line.startsWith('ls')) {
                    stdout.innerHTML += `<div class="text-cyan-400 font-bold">deploy.conf&nbsp;&nbsp;&nbsp;server.log&nbsp;&nbsp;&nbsp;readme.md&nbsp;&nbsp;&nbsp;backup.sh</div>`;
                } else if (line.startsWith('mkdir ')) {
                    const name = line.substring(6).trim();
                    stdout.innerHTML += `<div class="text-slate-500">[Simulated folder creation: ${escapeHtml(name)}]</div>`;
                } else {
                    if (!line.startsWith('#!') && !line.startsWith('if') && !line.startsWith('fi') && !line.startsWith('else')) {
                        stdout.innerHTML += `<div class="text-emerald-500/80">&gt; ${escapeHtml(line)}</div>`;
                    }
                }

                stdout.scrollTop = stdout.scrollHeight;
                setTimeout(runNextLine, 100);
            }

            runNextLine();
        }

        function escapeHtml(text) {
            return text
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }


        /* ---- QUIZ LOGICAL SUITE ---- */
        function renderQuizNavigator() {
            const nav = document.getElementById('quiz-nav-strip');
            nav.innerHTML = '';

            quizCollection.forEach((q, idx) => {
                const card = document.createElement('button');
                card.id = `quiz-nav-card-${idx}`;
                card.className = "flex-grow lg:flex-grow-0 p-3 rounded-xl text-xs font-bold transition border flex items-center justify-between text-left gap-2 shrink-0 lg:w-full";
                
                let icon = '<i class="fa-regular fa-circle text-slate-500"></i>';
                if (quizUserAnswers[idx] !== null) {
                    const correct = quizUserAnswers[idx] === q.correct;
                    icon = correct 
                        ? '<i class="fa-solid fa-circle-check text-emerald-400"></i>' 
                        : '<i class="fa-solid fa-circle-xmark text-rose-400"></i>';
                }

                card.innerHTML = `
                    <span class="flex items-center gap-2">
                        <span class="font-mono text-slate-500">Q${idx+1}</span>
                        <span class="hidden md:inline text-slate-300">Chapter ${idx+1}</span>
                    </span>
                    <span>${icon}</span>
                `;

                if (idx === activeQuizIndex) {
                    card.className += " bg-slate-900 border-emerald-500/30 text-emerald-400";
                } else {
                    card.className += " bg-slate-950 border-slate-900 text-slate-400 hover:border-slate-800";
                }

                card.onclick = () => renderQuizQuestion(idx);
                nav.appendChild(card);
            });

            // Update running calculations score tally indicator
            const solvedCorrectly = quizUserAnswers.reduce((accum, curr, i) => {
                return curr === quizCollection[i].correct ? accum + 1 : accum;
            }, 0);
            document.getElementById('quiz-score-badge').innerText = `Total Score: ${solvedCorrectly}/${quizCollection.length}`;
        }

        function renderQuizQuestion(idx) {
            activeQuizIndex = idx;
            const item = quizCollection[idx];

            document.getElementById('quiz-question-lbl').innerText = `Question ${idx + 1} of ${quizCollection.length}`;
            document.getElementById('quiz-question-txt').innerText = item.question;

            const container = document.getElementById('quiz-options-strip');
            container.innerHTML = '';

            const selected = quizUserAnswers[idx];

            item.options.forEach((opt, oIdx) => {
                const btn = document.createElement('button');
                btn.className = "w-full text-left p-3.5 rounded-xl text-xs font-medium border flex items-center justify-between transition-all duration-150 ";
                btn.innerText = opt;

                if (selected !== null) {
                    btn.disabled = true;
                    if (oIdx === item.correct) {
                        btn.className += " bg-emerald-950/40 border-emerald-500 text-emerald-300";
                        btn.innerHTML += `<i class="fa-solid fa-check-circle text-emerald-400 ml-2"></i>`;
                    } else if (oIdx === selected) {
                        btn.className += " bg-rose-950/40 border-rose-500 text-rose-300";
                        btn.innerHTML += `<i class="fa-solid fa-times-circle text-rose-400 ml-2"></i>`;
                    } else {
                        btn.className += " bg-slate-950 border-slate-900 text-slate-600";
                    }
                } else {
                    btn.className += " bg-slate-900 hover:bg-slate-850 border-slate-800 hover:border-emerald-500/40 text-slate-300";
                    btn.onclick = () => handleQuizOptionSelect(oIdx);
                }
                container.appendChild(btn);
            });

            const feedback = document.getElementById('quiz-feedback');
            if (selected !== null) {
                const passed = selected === item.correct;
                feedback.innerHTML = passed 
                    ? `<span class="text-emerald-400 font-bold">Awesome!</span> ${item.explanation}`
                    : `<span class="text-rose-400 font-bold">Incorrect.</span> ${item.explanation}`;
            } else {
                feedback.innerHTML = "Select an option above to submit your answer.";
            }

            const actionBtn = document.getElementById('quiz-action-btn');
            if (idx === quizCollection.length - 1) {
                actionBtn.innerHTML = `Restart Deck <i class="fa-solid fa-rotate-right"></i>`;
            } else {
                actionBtn.innerHTML = `Next Challenge <i class="fa-solid fa-chevron-right"></i>`;
            }

            renderQuizNavigator();
        }

        function handleQuizOptionSelect(optIdx) {
            quizUserAnswers[activeQuizIndex] = optIdx;
            renderQuizQuestion(activeQuizIndex);
        }

        function nextQuizQuestion() {
            if (activeQuizIndex < quizCollection.length - 1) {
                renderQuizQuestion(activeQuizIndex + 1);
            } else {
                // reset quiz progress state
                quizUserAnswers = Array(quizCollection.length).fill(null);
                renderQuizQuestion(0);
            }
        }

        // Expand practice challenge
        function toggleMissionReveal(id) {
            const pane = document.getElementById(id);
            if (pane.classList.contains('hidden')) {
                pane.classList.remove('hidden');
            } else {
                pane.className += ' hidden';
            }
        }

        // Reveal dynamic encryption code blocks
        function revealLabSolution(index) {
            const preBlock = document.getElementById(`lab-solution-pre-${index}`);
            const placeholder = document.getElementById(`lab-solution-placeholder-${index}`);
            if (preBlock && placeholder) {
                preBlock.classList.remove('hidden');
                placeholder.classList.add('hidden');
            }
        }

        // Reset solutions on slide transition
        function resetLabSolutions() {
            for (let i = 1; i <= 5; i++) {
                const preBlock = document.getElementById(`lab-solution-pre-${i}`);
                const placeholder = document.getElementById(`lab-solution-placeholder-${i}`);
                if (preBlock && placeholder) {
                    preBlock.classList.add('hidden');
                    placeholder.classList.remove('hidden');
                }
            }
        }
    </script>
</body>
</html>
