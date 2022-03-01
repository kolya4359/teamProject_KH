# travel-schedule-project
## 개발환경
1. java 11
2. STS4
3. MySql
## 세팅
1. Spring Web
2. Lombok
3. Spring Security
4. Spring Data Jpa
5. Maven

## 프로젝트 완료 후 느낀점
처음 해보는 협업 프로젝트여서 어려움이 많았다. 어떤 것부터 시작해야 하고, 구상이나 계획을 세우기가 힘들었다.  
우선, 강사님의 가이드 대로 기획안을 만들고 차근차근 준비를 하다보니 윤곽이 잡히고, 팀원들과 소통하며 부족한 부분들을 서로 돕다보니 어느새 웹페이지가 완성되어 갔다.  
팀원 모두 웹페이지 제작경험이 없어서 기획안을 만들 때는 구현하고 싶은 작업들로 가득 채웠고, 코딩을 진행하면서 수정도 하고, 기능을 빼기도 하고, 새로 알게 된 기능을 넣기도 하면서  
각자 공부한 기능들을 공유하며 서로서로 배워가는 시너지가 참 좋았다. 혼자서 작업하다가 같은 주제를 함께 작업하니 재밌는 부분이 많았다.  
프론트엔드 쪽에 관심이 있어서 React를 공부하고 있던 나는 SpringBoot 으로 작업하는 개발환경에서 할 수 있었던 퍼블리싱을 맡았다.  
SpringBoot 서버 개발보다 비교적 쉬웠던 내가 기획안을 만들기로 하고, 그동안 팀원들은 각자 맡은 기능을 구현하기 위한 공부를 시작했다. axure 이라는 툴을 사용하여 기획안을 만들고, 팀원들의 의견을 받아 수정을 거듭했다. 기획안이 완성되고 바로 웹페이지 제작에 들어갔다. 먼저, 팀장이 개발환경과 세팅을 Git에 공유하고, 내가 HTML을 만들어서 Git에 공유하면, 팀원들이 다운 받아 각자 기능을 입혀서 다시 올리는 식으로 진행했다. 모두 Git을 처음 써보는 상황이라 branch를 나눠서 작업하지 못한 것이 조금 아쉬웠다. 한 명, 한 명 기능을 합칠 때마다 Error가 발생해서 골치가 아프고 작업이 길어졌지만, 결국엔 협동하여 Error를 해결하고, 기능이 구현되는 것을 볼 때마다 신기하면서 뿌듯했다. 모든 기능을 추가하고 내가 레이아웃을 정리하면서, 내부 스타일 시트(Internal style sheet)로 작업했던 것이 가독성이 떨어지는 것 같다 하여, 파일을 만들어 외부 스타일 시트(External style sheet)로 구역을 나눠 정리하고, 반응형 웹사이트로 구현하면서 마무리됐다.  
구역을 나누는 것이 너무 어려웠고, 구역을 나누는 방법(Grid, Flex)도 여러가지여서 어떤 것을 사용해야 하는지 고민이었고, 디자인 적인 측면을 고려하면서 기능에 맞게 나누는 것도 어려웠다.  
많이 부족한 실력이었지만, 너그러이 이해해 주고, CSS 인강을 추천해주고, 의견을 모아 함께 소통하며 진행해주었던 팀원들이 고마웠다. 다음에 기회가 된다면 좀 더 체계적으로 계획을 세우고, Git도 제대로 사용해보고, 퀄리티 높은 웹사이트를 협업으로 제작해 보고 싶다.

## 기획안 (AXURE)  
  
![1](https://user-images.githubusercontent.com/79749251/149657277-779282c5-992e-4f23-8841-0bec9a43b553.png)

![2](https://user-images.githubusercontent.com/79749251/149657421-79a68abc-5ea2-482e-b134-95f272e22d52.png)

![3](https://user-images.githubusercontent.com/79749251/149657425-528a9b96-8986-4fbf-a8a7-26d6a5280817.png)

<hr />

## 제주 여행 공유 사이트 (JAVA_SpringBoot)

### 공통 기술

- 글 작성 / 수정 / 삭제는 로그인 한 이용자만 가능.
- 비로그인 상태에선 Header에 로그인 / 회원가입 이 보이고 로그인 후에는 회원정보페이지 / 로그아웃 이 표시.
- 화면의 크기에 따라 contents의 크기도 달라짐.

### Main Page

![1](https://user-images.githubusercontent.com/79749251/149669371-b236e487-8533-4113-8de4-ce8359f7c0f8.png)

![1-1](https://user-images.githubusercontent.com/79749251/149659057-beb07aed-944c-45c2-900e-454fd01a4f7a.png)

- Main Page에선 검색어 입력이 가능합니다. 제주도 관광 명소를 검색하면 해당 관광 명소에 대한 리스트가 표시되고, click 시 DB에 저장되어 있는 관광 명소 상세페이지를 불러옵니다.
- 상세페이지에는 후기게시판으로 이동하는 후기 작성 Button과 명소 사진, 주소, 설명, 위치 지도, 사람들의 한줄평을 볼 수 있습니다.
- 지도API는 카카오API를 이용하여 JavaScript로 확대/축소가 가능하고 마커기능을 추가하여 명소의 위치를 지도에 표시할 수 있도록 하였습니다.
- Main Page에 하단에는 제주도 관광 명소API를 DB에 저장하여 화면을 렌더링 할 때마다 랜덤으로 표시되도록 하였습니다. 이미지를 click 하면 해당 명소의 상세페이지를 불러옵니다.

<hr />

### Login

![2](https://user-images.githubusercontent.com/79749251/149658930-c24b6378-b6e9-4bec-a075-5d374dbc6035.png)

- Login은 회원가입 하여 DB에 정보를 저장한 후 Login 하는 방법과 카카오Login API를 추가하여 카카오 ID 로 로그인 하는 방법이 있습니다.
- Email로 ID를 찾을 수 있고, 비밀번호가 기억나지 않을 경우, ID와 Email을 입력하면 Email로 임시비밀번호가 보내져 로그인할 수 있습니다.
- ID와 PASSWORD 칸이 공백이거나 DB에 저장된 정보와 다를 경우, Alert 창으로 경고를 합니다.

<hr />

### SignUp

![3](https://user-images.githubusercontent.com/79749251/149659188-848c29b6-c9e3-4c31-8770-e58bd9ee47c4.png)

- 회원가입 페이지에선 DB에서 요구하는 기본정보들을 입력하고, ID가 DB에 있는 경우 중복알림 Alert 창이 호출됩니다. 중복확인을 안 하고 회원가입을 눌렀을 경우에도 Alert 창이 호출됩니다.
- 각 칸이 공백일 경우, 회원가입이 안 됩니다.
- 회원정보 수정 페이지에선 ID와 이름, Email이 disabled 처리가 되어 수정이 불가능하고 비밀번호만 수정이 가능합니다.
- 탈퇴 Button을 누르면 DB에서 해당 ID의 정보가 삭제됩니다.

<hr />

### Question Board

![4](https://user-images.githubusercontent.com/79749251/149669506-40a10a2f-4ad7-4607-a7c6-19a1e2df3aab.png)

- 문의 페이지는 게시판 형식으로 만들었습니다. 글을 작성하면 작성 순서대로 번호가 매겨지고, 제목, 작성자, 작성일이 표시됩니다.
- Pagination 기능을 구현하여 글이 4개이상 넘어갈 경우, 화살표를 눌러서 다음글이나 이전글을 볼수 있습니다.  
- 해당 글의 제목을 click하면 상세페이지를 호출하고, 상세페이지에선 뒤로가기 / 수정 / 삭제 가 가능하고, 문의에 대한 답변을 게시할 수 있습니다.

<hr />

### Review Board

![5](https://user-images.githubusercontent.com/79749251/149669856-1a8aa5e6-89d6-42c9-9e92-a359dabaa869.png)

- 후기 페이지는 Header의 카테고리 click 시, Main 상세페이지에서 후기작성Button을 click 시 호출됩니다.
- 문의 페이지와 마찬가지로 게시판 형식입니다.

