

<!-- Data Damoa -->
# Data Damoa
<img width="400" alt="logo" src="https://user-images.githubusercontent.com/6459539/113552548-40d1fe80-9631-11eb-94d4-f91ab43afb3e.png"><br>
캡스톤 27조 - 데이터 다모아 [[팀페이지 이동]](https://kookmin-sw.github.io/capstone-2021-27) [[중간발표자료]](https://github.com/kookmin-sw/capstone-2021-27/blob/master/docs/캡스톤_중간발표27.pdf)

## Intro
[[Intro 영상 다운로드]](https://github.com/kookmin-sw/capstone-2021-27/blob/master/docs/27_Intro.mp4)
    
    
## 27조 팀원 소개
박지호 
* 담당: 개발 팀장
* 학번: 20163110
* 이메일: applemac@kookmin.ac.kr
* 역할: Server, DB

정지현
* 담당: 기획 팀장
* 학번: 20171700
* 이메일: jung211p@kookmin.ac.kr
* 역할: Server, DB


## 간단한 소개
학습하기 위한 데이터를 필요한 이용자가 일정 금액을 주고 데이터를 요청하면 다른 이용자가 어플리케이션을 이용하여 데이터를 주고 금액을 받는 플랫폼

## 슬로건
데이터가 돈이다! 데이터 다모아

## 배경
작년 상반기에 국토부 주관 자율주행 대회에 참가하여 머신러닝을 이용한 Object Detection 파트를 맡았습니다. 이때 데이터를 학습시키기 위해 많은 양의 데이터셋이 필요했는데, 대용량 데이터셋을 구하는 것이 쉽지 않았습니다. 빅데이터와 인공지능 개발이 활발히 이루어지고 있는 시점에서 질좋은 대용량 데이터는 필수적이며, 이를 통해 더욱 발전 할 수 있습니다. 따라서 저희는 데이터셋을 쉽게 구할 수 있는 플랫폼을 제작하기로 하였습니다.

## 서비스 구성도
<img width="600" alt="introduction" src="https://user-images.githubusercontent.com/6459539/113553886-66600780-9633-11eb-8564-ce1e1e7a35b4.png">

## 사용 시나리오
1. Data Collector가 금액을 설정하여 데이터를 요청한다.
2. Data Maker는 사진촬영 후 라벨링하여 데이터를 전송한다.
3. Data Collector는 데이터를 수집한다.
4. Data Maker는 Data Collector가 제시한 금액을 받는다.

## 기대효과
* Data Collector가 데이터를 손쉽게 모을 수 있다.
* Data Maker는 게시판에 있는 데이터를 수집할 수 있으면 간단한 용돈벌이를 할 수 있다.

## 핵심 기능
* 데이터를 요청하는 사람(Data Collector)이 필요한 데이터를 요청한다.
* 데이터를 제공해주는 사람(Data Maker)는 Data Collector에게 필요한 데이터를 제공해준다.
* Data Collector는 데이터를 받고, Data Maker는 일정 금액을 받는다.

## 기술 스택
Front-end
* HTML5, CSS, JS

Back-end
* Node.js

Android App
* Java

 
## DB 구조
<img width="550" alt="DB_StructureV5" src="https://user-images.githubusercontent.com/6459539/113550784-9eb11700-962e-11eb-9ee9-6d6939b5e37e.png">

--- 

## 페이지 구성

#### 메인 페이지

<img width="350" alt="main" src="https://user-images.githubusercontent.com/6459539/113556671-c8227080-9637-11eb-9317-97dfdb05373b.png">

---

#### 로그인 및 회원가입 페이지

<img width="400" alt="login" src="https://user-images.githubusercontent.com/6459539/113556871-10419300-9638-11eb-8756-0d1f2390d7bd.png"> <img width="350" alt="join" src="https://user-images.githubusercontent.com/6459539/113556878-12a3ed00-9638-11eb-9f20-cc5ccb4d4b34.png">

---

#### 검색 페이지

<img width="450" alt="search" src="https://user-images.githubusercontent.com/6459539/113556972-3f580480-9638-11eb-8075-edd8623ab85b.png">

---

#### 게시물 작성 페이지

<img width="600" alt="write_board" src="https://user-images.githubusercontent.com/6459539/113557107-729a9380-9638-11eb-98c6-35be2cd632d8.png">

---

#### 라벨링 페이지

<img src="https://user-images.githubusercontent.com/6459539/113551229-44648600-962f-11eb-914d-db03ca25e30f.gif" width="500">

---

#### 게시물 작성 및 Q&A 페이지

<img width="350" alt="view" src="https://user-images.githubusercontent.com/6459539/113557243-a970a980-9638-11eb-8c0c-5dee637935a6.png"> <img width="350" alt="qa" src="https://user-images.githubusercontent.com/6459539/113557240-a8d81300-9638-11eb-9f9e-29eefdde6723.png">

---

#### 입출금 페이지

<img width="400" alt="cash" src="https://user-images.githubusercontent.com/6459539/113557233-a7a6e600-9638-11eb-8367-4fce6fd6e137.png">

