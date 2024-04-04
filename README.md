# 🎼음악인 커뮤니티 웹서비스🎵

```
🚩 개요
- 자바 스프링을 활용한 웹 프로그래밍 프로젝트
  - 구인, 홍보, 커뮤니티 기능들이 활성화 된 사이트
  - 데이터를 추출하고 가공하여 시각화 하는 작업 수행
- 기간 : 2023.11 ~ 2023.12

⚙️ 개발 환경
- Java 11
- JDK 1.11.0
- IDE : STS 3.9
- Framework : Spring 5.3.20
- Build Tool : Maven
- Database : Oracle DB(11xe)
- ORM : Mybatis
```

<br/>

## ✔ 시작가이드

### 🎹 Installation

```
git clone <https://github.com/SeguirLuna0114/Spring-Community.git>
```

### 🎹 Backend

```
** application.properties 파일에 있는 secret 키를 모두 입력 후 가동 가능

# Spring DB연결정보
- hikariConfig.driverClassName : driverClassName 값 지정
- hikariConfig.jdbcUrl : jdbcUrl 지정
- hikariConfig.username : Connection을 얻어내기 위해서 사용되는 인증 이름
- hikariConfig.password : username과 쌍이 되는 비밀번호 지정

# default mail propertie 정보 - mail properties를 받을 도메인 생성
- jMailSender.port : 포트번호
- jMailSender.username : 계정 이메일
- jMailSender.password : 비밀번호

naverId.login.develApp.key=xJeBrLOKcF1jhMTonLZ_
```

<br/>

### ✔ Stack
|Category|Language|
|:--:|:--|
|Frontend|![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) ![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white) ![Ajax](https://img.shields.io/badge/Ajax-009688?style=for-the-badge&logo=&logoColor=white) |
|Backend|![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) ![Spring Boot](https://img.shields.io/badge/Spring_Boot-F2F4F9?style=for-the-badge&logo=spring-boot) ![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white) ![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white) ![Maven](https://img.shields.io/badge/apache_maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white) ![MyBatis](https://img.shields.io/badge/MyBatis-4183C4?style=for-the-badge&logo=&logoColor=white) |
|Database|![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white) ![AmazonDynamoDB](https://img.shields.io/badge/Amazon%20DynamoDB-4053D6?style=for-the-badge&logo=Amazon%20DynamoDB&logoColor=white) |
|Cloud|![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)|
|Enviroment<br />(Dev Tools)|![STS](https://img.shields.io/badge/Spring_Tool_Suite-6AAD3D?style=for-the-badge&logo=spring&logoColor=white) ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white) |
|OS|![Red Hat](https://img.shields.io/badge/Red%20Hat-EE0000?style=for-the-badge&logo=redhat&logoColor=white) ![Tomcat](https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=Apache%20Tomcat&logoColor=white)|
|Communication|![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white) |

<br/>

### ✔ 주요 기능

|  | 핵심 기능 |
| --- | --- |
| 구축 | - DB설계 및 구축<br/>- back 서버 구축<br/>- 시스템 아키텍처 설계<br/>- 화면 UI 설계 |
| 게시판 공통 기능<br/>구인/홍보/커뮤니티 | - 제목, 내용, 제목+내용 검색<br/>- 게시판 글 목록 및 페이징 처리(10개씩 출력)<br/>- 조회수/최신순 필터 정렬<br/> - 비밀 댓글 기능 |
| 상세 페이지<br/>구인/홍보/커뮤니티 | - 쪽지 팝업 생성 : jQuery모달창 팝업으로 쪽지 보내기<br/>- 파일 업로드/다운로드(파일타입,크기 유효성 검사)<br/>- 유튜브 영상 임베드(링크)<br/>- 좋아요 설정/취소 버튼<br/>- 지도 API 활용 |
| 마이 페이지 | - 게시판 및 활동 별 요약 목록 페이지 구현(필터 정렬, 키워드 검색)<br/>- 작성한 글 목록 확인 및 선택/전체 삭제<br/>- 개인 프로필 화면 : 각 활동 횟수 Count<br/>- 개인정보 수정 및 회원탈퇴<br/>- 추천 공고<br/>- 받은/보낸 쪽지함 목록 : 읽음 여부 확인 및 취소<br/>- 실시간 받은 쪽지 알림 |
| 관리자 페이지 | - 1:1 문의 접수내역 확인/완료 처리<br/>- 회원 정지 및 강제 탈퇴 권한 |
| 로그인/회원가입 페이지 | - 소셜 로그인 연동(네이버 및 카카오 로그인 api)<br/>- 아이디, 비밀번호 ajax 유효성 검사<br/>- 이메일 인증 및 인증 번호 전송<br/>- Spring security 로그인/로그아웃<br/>- 비밀번호 암호화(PasswordEncoder)<br/>- 아이디/비밀번호 찾기(이메일 인증후 진행)<br/>- 아이디 저장/자동로그인 |

> - 데이터베이스 설계 및 UI를 설정한 후, 이를 토대로 홈페이지 및 기능 구현

<br/>

### ✔ 프로젝트 주제 선정 계기

> - 음악인들이 정보를 파악하며 소통하기 위한 커뮤니티
> - 구인, 홍보, 커뮤니티 게시판을 활용하여 정보를 한눈에 파악 가능한 사이트를 통해 클래식 연주자들의 일자리 관련 접근성 확대

<br/>

### ✔ 아키텍처

![spring_commproject_Architecture](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/Architecture_spring.png?raw=true)

> - AWS 및 Java Spring을 활용하여 기능 구현

<br/>

### ✔ DB 설계

![spring_commproject_DB](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/DB_obri.png?raw=true)

<br/>

### ✔ 화면 구성

|  |  |
| ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------|
|![mainhome](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/mainhome_obri.png?raw=true)|![mainhome_login](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/mainhome_userLogin_obri.png?raw=true)|
|홈화면|로그인후 홈화면|
|![mypage_apply](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/mypage_apply_obri.png?raw=true)|![mypage_jobManage](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/mypage_jobBoard_obri.png?raw=true)|
|마이페이지 - 지원공고 관리|마이페이지 - 구인공고 관리|
|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/rcvmessage_alert_obri.png?raw=true)|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/prLike_obri.png?raw=true)|
|쪽지 알림 및 조회|좋아요 설정 홍보 글 관리|
|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/login_obri.png?raw=true)|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/findpasswd_obri.png?raw=true)|
|로그인 API 활용|비밀번호 찾기|
|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/jobBoard_withMap_obri.png?raw=true)|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/prPage_obri.png?raw=true)|
|구인 게시판 - 글 작성 및 지도API를 이용한 장소표시|홍보 게시판 - 유튜브 링크 및 좋아요 설정 |
|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/commPage_withsecret_obri.png?raw=true)|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/comLike_obri.png?raw=true)|
|커뮤니티 게시판 - 글 작성 및 좋아요, 비밀글 설정|좋아요 설정 커뮤니티 글 관리|
|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/admin_manage_obri.png?raw=true)|![image](https://github.com/SeguirLuna0114/Spring-Community/blob/main/img/QnA_withFile_obri.png?raw=true)|
|관리자 페이지 - 게시판 글 삭제| 문의 글 작성|

<br>

---

### ✔ Ongoing

- 전체적인 css 통일
- 쪽지 알림 보완
- 아이디 저장 및 자동로그인 보완
