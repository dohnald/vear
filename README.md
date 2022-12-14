# vear : vim += bear
vear는 **v**i에서 b**ear** 문서 작업을 하려고 시작한 프로젝트입니다. 

## 설치

```bash
git clone git@github.com:dohnald/vear.git ~/vear
chmod +x ~/vear/*.sh
brew install jq fzf
```

```shell
# .token 수정 
# vim ~/vear/.token
XXXXX-XXXXXX-XXXXXX
```

```shell
# .vimrc 추가
function! VearSave()
    let l:save_bear_command = "~/vear/save.sh"
    let l:filename = "\"%:r\""
    execute "silent !" . l:save_bear_command . " " . filename
endfunction

function! VearRemove()
    let l:save_bear_command = "~/vear/save.sh"
    let l:filename = "\"%:r\""
    execute "!rm " . filename . ".md"
endfunction

augroup vearauto
    autocmd BufWritePost *vear/*.md call VearSave()
    autocmd ExitPre *vear/*.md call VearRemove()
augroup END
```

## 사용 

```bash
cd ~/vear
vear
```
![](./src/vear-readme1.png)
![](./src/vear-readme2.png)
![](./src/vear-readme3.png)
![](./src/vear-readme4.png)
![](./src/vear-readme5.png)
![](./src/vear-readme6.png)

## 도움 

1. 문서 리스트 조회 조건을 변경하려면?
	* `open.sh`의 `@last3days`의 숫자를 변경하거나 검색어를 입력할 수 있습니다.
2. vimwiki에서 checkbox toggle을 bear와 맞추려면?
    * `.vimrc` 설정 추가
    ```shell
    let g:vimwiki_listsyms = '    x'
    ```

## 미래

1. shell script와 vimconfig를 수정하지 않고 vim-script를 이용해 편하게 설치할 수 있게 하고 싶습니다.
