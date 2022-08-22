# vear : vim += bear
vear는 *v*i에서 b*ear) 문서 작업을 하려고 시작한 프로젝트입니다. 

## 설치

```bash
git clone git@github.com:dohnald/vear.git ~/vear
chmod +x ~/vear/*.sh
brew install jq fzf
```

```shell
# .token 수정
XXXXX-XXXXXX-XXXXXX
```

```shell
# .vimrc 추가
function! SaveVear()
    let l:save_bear_command = "~/vear/save.sh"
    let l:filename = "\"%:r\""
    execute "silent !" . l:save_bear_command . " " . filename
endfunction

function! RemoveVear()
    let l:save_bear_command = "~/vear/save.sh"
    let l:filename = "\"%:r\""
    execute "!rm " . filename . ".md"
endfunction

augroup vearauto
    autocmd BufWritePost *vear/*.md call SaveVear()
    autocmd ExitPre *vear/*.md call RemoveVear()
augroup END
```

## 사용 

```bash
cd ~/vear
vear
```

## 도움 

1. 문서 리스트 조회 조건을 변경하려면?
	* `open.sh`의 `@last3days`의 숫자를 변경하거나 검색어를 입력할 수 있습니다.

## 미래

1. shell script와 vimconfig를 수정하지 않고 vim-script를 이용해 편하게 설치할 수 있게 하고 싶습니다.
