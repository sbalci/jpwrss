# Template for a Basic jamovi Module  

- [official documentation](https://dev.jamovi.org/)
- [a beginners guide to jamovi](https://sbalci.github.io/ClinicoPathJamoviModule/articles/module_development_jamovi.html)


## TL;DR

- Use this repo as template: https://github.com/sbalci/jamoviTemplate to generate a new repo

- Use `R >= 4.0.2`

- Current package repository is: https://cran.microsoft.com/snapshot/2020-08-24

- Install jamovi
    - Get the latest (1.6.3) https://www.jamovi.org/download.html  
    - If using mac use this: https://www.jamovi.org/downloads/jamovi-unsigned.zip

- Install `jmvtools` package with:

```r
install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))
```

<details>
 <summary>    - Install jamovi package family:</summary>

```r
options(repos = c('https://cran.microsoft.com/snapshot/2020-08-24'))

suppressPackageStartupMessages({
  if (!requireNamespace('jmvtools'))
  {
    install.packages('jmvtools',
                     repos = c('https://repo.jamovi.org', 'https://cran.r-project.org'))
  }
})
suppressPackageStartupMessages(library('jmvtools'))

suppressPackageStartupMessages({
  if (!requireNamespace('jmv')) {
    install.packages('jmv', dependencies = TRUE)
  }
})
suppressPackageStartupMessages(library('jmv'))

suppressPackageStartupMessages({
  if (!requireNamespace('jmvconnect')) {
    install.packages('jmvconnect', dependencies = TRUE)
  }
})
suppressPackageStartupMessages(library('jmvconnect'))

suppressPackageStartupMessages({
  if (!requireNamespace('jmvcore')) {
    install.packages('jmvcore', dependencies = TRUE)
  }
})
suppressPackageStartupMessages(library('jmvcore'))

suppressPackageStartupMessages({
  if (!require('devtools')) {
    install.packages('devtools')
  }
})
suppressPackageStartupMessages(library('devtools'))
```

</details>

- Locate jamovi bin folder:
    - windows: `jmvtools::check("C://Program Files//jamovi//bin")`  
    I recommend changing folder name from default `jamovi x.x` to `jamovi`  
    - mac: `jmvtools::check("~/Applications/jamovi.app")`  


- Inside this repo folder in R run `jmvtools::install()`

- A file named jamoviTemplate.jmo and install this module to jamovi

- The repo is like an R package except `jamovi` folder. 

- You need to edit `R/...b.R` files.
    - https://dev.jamovi.org/tuts0104-implementing-an-analysis.html  
    - https://dev.jamovi.org/tuts0105-debugging-an-analysis.html  

- run `jmvtools::install()` again.

- Let [me](https://github.com/sbalci) know how it goes :)


## linux needs additional installations

<details>
 <summary>
- linux codes
 </summary>

https://cran.r-project.org/bin/linux/ubuntu/README.html

- flatpak  

```
flatpak install -y flathub org.freedesktop.Platform//19.08
flatpak install -y flathub org.freedesktop.Sdk//19.08

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.jamovi.jamovi
flatpak run org.jamovi.jamovi
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.freedesktop.Sdk//19.08
flatpak install flathub org.freedesktop.Platform//19.08

sudo apt install flatpak-builder
flatpak-builder --run build_folder org.app.json

```

- R

```
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt install r-base r-base-core r-recommended r-base-dev
```

- RStudio

```
sudo apt install '/home/serdarbalci/Downloads/rstudio-1.3.1073-amd64.deb'

```

- git

```
sudo apt install git-all
```

- gtk3

```
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
```

- V8 (I could not make this run)

```
sudo apt-get install libv8-dev
sudo apt-get install libnode-dev


sudo apt install build-essential
gcc --version
sudo apt-get install gfortran

sudo apt-get install r-base-dev
git status


sudo apt install libcurl4-openssl-dev
sudo apt install libxml2-dev

```

</details>



## add analysis

```r
jmvtools::addAnalysis(name = 'neofun', title = 'New Function')
```

## using devtools

- If you want to use devtools, remove `NAMESPACE` file. 


## how jamovi module functions?

- See: [jamovi working structure](https://docs.google.com/presentation/d/e/2PACX-1vTfA7dL5y_PzY5L-f8FRxaqvKMME5pcDCbXtWk5-FUNCGJyFKpGJEp8ES9rAge0CbI3Gcbi7Emv4e-S/pub?start=true&loop=true&delayms=3000)


## need inspiration?

- all code is available:  
https://github.com/jonathon-love/jamovi-library/blob/master/modules.yaml


- <a href = "https://github.com/search?q=type: Level+repo%3Ajamovi%2Fjmv+repo%3Araviselker%2Fscatr+repo%3Ajonathon-love%2FRj+repo%3Aricharddmorey%2Fjpower+repo%3Agamlj%2Fgamlj+repo%3Ajamovi-amm%2Fjamm+repo%3Ajonathon-love%2Fjsq+repo%3Ajonathon-love%2Fjsq+repo%3Araviselker%2Fmedmod+repo%3Arcalinjageman%2Fesci+repo%3Araviselker%2Fsurveymv+repo%3Araviselker%2Fmanytee+repo%3Akylehamilton%2FMAJOR+repo%3Ajamovi%2Fwalrus+repo%3ALakens%2FTOSTER+repo%3Ajonathon-love%2Fdeathwatch+repo%3Asbalci%2Fjsurvival+repo%3Adustinfife%2Fflexplot+repo%3Asbalci%2Fjjstatsplot+repo%3Ahyunsooseol%2Fseolmatrix+repo%3Ajonathon-love%2FsnowIRT+repo%3Ahyunsooseol%2FsnowRMM+repo%3AWLenhard%2FcNORM_JAMOVI+repo%3Ajonathon-love%2Fmoretests+repo%3AMrihs%2FdistrACTION+repo%3Adavidfoxcroft%2Flsj-data+repo%3Ajamovi%2Fr-datasets+repo%3Arivkamdevries%2FStatkat+repo%3Asbalci%2FClinicoPathDescriptives+repo%3Asbalci%2Fmeddecide+repo%3Alucasjfriesen%2FjamoviPsychoPDA+repo%3ASebastien-Le%2FQM+repo%3Ajonathon-love%2Fblandr+repo%3Ajamovi%2FjmvbaseR+repo%3Araviselker%2Fjmvarcade+repo%3Asjentsch%2FPartialProximity&type=Code&ref=advsearch&l=&l=">use advanced search in github</a>



- check out my codes:  
https://github.com/sbalci/ClinicoPathJamoviModule


## how to remove functions?


- delete these files:

```bash
.
└── jamoviTemplate/
    ├── R/
    │   ├── neofun.b.R
    │   └── neofun.h.R
    └── jamovi/
        ├── neofun.a.yaml
        ├── neofun.r.yaml
        └── neofun.u.yaml 
```



- also delete this portion from `analysis` portion of `jamovi/0000.yaml`

```yaml
  - title: New Function
    name: neofun
    ns: jamoviTemplate
    menuGroup: jamoviTemplate
    menuTitle: New Function
```
