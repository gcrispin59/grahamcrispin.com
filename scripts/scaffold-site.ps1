# Generate static HTML pages for grahamcrispin.com (run from repo root)
$ErrorActionPreference = "Stop"
$Root = Split-Path $PSScriptRoot -Parent
Set-Location $Root

function Get-Header {
    return @'
    <header class="site-header">
        <nav class="main-navigation">
            <div class="nav-container">
                <div class="logo"><a href="/">GrahamCrispin.com</a></div>
                <ul class="nav-menu">
                    <li class="dropdown">
                        <a href="/about/" class="nav-link">About</a>
                        <ul class="dropdown-menu">
                            <li><a href="/about/background.html">Background</a></li>
                            <li><a href="/about/expertise.html">Expertise</a></li>
                            <li><a href="/about/experience.html">Experience</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="/services/" class="nav-link">Services</a>
                        <ul class="dropdown-menu">
                            <li><a href="/services/mentoring.html">Engineering Mentoring</a></li>
                            <li><a href="/services/consulting.html">Professional Consulting</a></li>
                            <li><a href="/services/development.html">Professional Development</a></li>
                        </ul>
                    </li>
                    <li><a href="/realize/" class="nav-link">Realize</a></li>
                    <li><a href="/contact.html" class="nav-link">Contact</a></li>
                </ul>
            </div>
        </nav>
    </header>
'@
}

function Get-Footer {
    return @'
    <footer class="site-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>GrahamCrispin.com</h3>
                    <p>Professional engineering services and mentoring for career advancement and technical excellence.</p>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="/about/">About</a></li>
                        <li><a href="/services/">Services</a></li>
                        <li><a href="/realize/">Realize</a></li>
                        <li><a href="/contact.html">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Other Sites</h4>
                    <ul>
                        <li><a href="https://futurefoundationspac.org" rel="noopener">Future Foundations</a></li>
                        <li><a href="https://praetorspectral.com" rel="noopener">PraetorSpectral</a></li>
                        <li><a href="https://maggie.futurefoundationspac.org" rel="noopener">MAGGie</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 GrahamCrispin.com. All rights reserved.</p>
            </div>
        </div>
    </footer>
'@
}

function New-SitePage {
    param(
        [string]$RelativePath,
        [string]$Title,
        [string]$HeroTitle,
        [string]$HeroSubtitle,
        [string]$MainContent,
        [string]$CssHref = "css/style.css"
    )

    $dir = Split-Path (Join-Path $Root $RelativePath) -Parent
    if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$Title</title>
    <link rel="stylesheet" href="$CssHref">
</head>
<body>
$(Get-Header)
    <main class="main-content">
        <section class="page-hero">
            <div class="container">
                <h1>$HeroTitle</h1>
                <p>$HeroSubtitle</p>
            </div>
        </section>
        <section class="content-section">
            <div class="container prose">
$MainContent
            </div>
        </section>
    </main>
$(Get-Footer)
</body>
</html>
"@

    $out = Join-Path $Root $RelativePath
    Set-Content -Path $out -Value $html -Encoding UTF8
    Write-Host "Created $RelativePath"
}

# Inner pages under subdirectories use ../css/style.css
$cssSub = "../css/style.css"

New-SitePage -RelativePath "about/index.html" -Title "About - GrahamCrispin.com" -HeroTitle "About Graham Crispin" -HeroSubtitle "Engineering leadership, AI safety, and professional mentoring." -CssHref $cssSub -MainContent @'
                <p>Graham Crispin provides professional engineering services, Masters of Engineering mentoring, and organizational consulting through Realize BV and related programs.</p>
                <p>Explore <a href="/about/background.html">background</a>, <a href="/about/expertise.html">expertise</a>, and <a href="/about/experience.html">experience</a>.</p>
'@

New-SitePage -RelativePath "about/background.html" -Title "Background - GrahamCrispin.com" -HeroTitle "Background" -HeroSubtitle "Engineering career and professional foundation." -CssHref $cssSub -MainContent @'
                <p>Graham brings decades of engineering practice combined with research in AI safety, human flourishing, and organizational risk assessment.</p>
                <p>Work spans technical leadership, mentoring programs aligned with the <a href="/mentoring.html">MoE mentoring initiative</a>, and frameworks documented across Future Foundations and ARTI Scale programs.</p>
'@

New-SitePage -RelativePath "about/expertise.html" -Title "Expertise - GrahamCrispin.com" -HeroTitle "Expertise" -HeroSubtitle "AI safety, mentoring, and quantitative risk assessment." -CssHref $cssSub -MainContent @'
                <ul>
                    <li>Masters of Engineering mentoring and professional development</li>
                    <li>ARTI Scale organizational threat assessment</li>
                    <li>Human-AI collaboration and multi-agent system design</li>
                    <li>Authentic identity and sovereignty development (AEGIS)</li>
                </ul>
                <p>See <a href="/services/consulting.html">Professional Consulting</a> and <a href="/realize/">Realize BV</a> for service details.</p>
'@

New-SitePage -RelativePath "about/experience.html" -Title "Experience - GrahamCrispin.com" -HeroTitle "Experience" -HeroSubtitle "Delivery across engineering, consulting, and program leadership." -CssHref $cssSub -MainContent @'
                <p>Experience includes executive mentoring, corporate briefings, technical consulting, and program development for engineering excellence.</p>
                <p>Current programs connect to <a href="https://maggie.futurefoundationspac.org" rel="noopener">MAGGie</a> and the linear-ai-agents MoE mentoring stack.</p>
'@

New-SitePage -RelativePath "services/index.html" -Title "Services - GrahamCrispin.com" -HeroTitle "Professional Services" -HeroSubtitle "Mentoring, consulting, and development programs." -CssHref $cssSub -MainContent @'
                <div class="features-grid">
                    <div class="feature-card">
                        <h3><a href="/services/mentoring.html">Engineering Mentoring</a></h3>
                        <p>Personalized MoE mentoring for career and technical advancement.</p>
                    </div>
                    <div class="feature-card">
                        <h3><a href="/services/consulting.html">Professional Consulting</a></h3>
                        <p>Organizational threat assessment and strategic consulting.</p>
                    </div>
                    <div class="feature-card">
                        <h3><a href="/services/development.html">Professional Development</a></h3>
                        <p>MAGGie Masters and structured development programs.</p>
                    </div>
                </div>
'@

New-SitePage -RelativePath "services/mentoring.html" -Title "Engineering Mentoring - GrahamCrispin.com" -HeroTitle "Engineering Mentoring" -HeroSubtitle "Masters of Engineering mentoring for professional excellence." -CssHref $cssSub -MainContent @'
                <p>Personalized mentoring for engineering professionals seeking to advance careers and technical expertise through structured MoE programs.</p>
                <p>Programs integrate wellbeing, authentic identity development, and practical engineering leadership. Explore the live MAGGie platform:</p>
                <p><a class="cta-button primary" href="https://maggie.futurefoundationspac.org" rel="noopener">Visit MAGGie</a>
                <a class="cta-button secondary" href="/book.html">Schedule Consultation</a></p>
'@

New-SitePage -RelativePath "services/consulting.html" -Title "Professional Consulting - GrahamCrispin.com" -HeroTitle "Professional Consulting" -HeroSubtitle "Organizational threat assessment and strategic risk analysis." -CssHref $cssSub -MainContent @'
                <p><strong>Pillar 2: Organizational Threat Assessment</strong> — ARTI Scale integration with strategic risk analysis for corporations, government agencies, and NGOs.</p>
                <p>Quantitative assessment of existential risks from technological convergence. Delivery includes corporate consulting, threat assessments, and strategic planning.</p>
                <p><a href="/realize/">Realize BV</a> | <a href="/contact.html">Contact</a></p>
'@

New-SitePage -RelativePath "services/development.html" -Title "Professional Development - GrahamCrispin.com" -HeroTitle "Professional Development" -HeroSubtitle "MAGGie Masters and structured learning paths." -CssHref $cssSub -MainContent @'
                <p>MAGGie Masters supports engineering excellence and career advancement through assessments, coaching materials, and online programs.</p>
                <p><a class="cta-button primary" href="https://maggie.futurefoundationspac.org/test" rel="noopener">MAGGie Sovereignty Test</a></p>
'@

Write-Host "Scaffold complete."
