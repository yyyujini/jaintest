## 사전 요구 사항 

이 글에서 다루게 될 기술과 사전 요구 사항이에요.

- aws 테스트 계정과 aws access key
- awscli 설치 및 Access Key 등록
	~~~
	brew install awscli
	aws configure
	# 발급 받은 AWS Access Key를 입력합니다. 저는 편의상 Admin 권한이 있는 원타임 Key를 사용했어요.
	~~~
- terraform 설치
	~~~
	brew tap hashicorp/tap
	brew install hashicorp/tap/terraform
	~~~
- helm 설치
	~~~
	brew install helm
	~~~
- git 설치
	~~~
	brew install git
	~~~
- git clone : 띵스플로우 인프라팀에서 공개하는 핸즈온 교육에 필요한 코드입니다.  
반드시 clone 후 본인의 public repo로 먼저 push 하세요.
	~~~
	git clone https://github.com/thingsflow/eks-cicd-handson.git
	# 본 핸즈온은 public repo 기준으로 작성했습니다.
	~~~

## Terraform을 활용한 EKS 구축
### EKS 스펙
terraform/_terraform.auto.tfvars 파일에 정의된 EKS 스펙은 간단하게 아래와 같습니다.	
- Cluster version : 1.22
- Public Access : True
- Node Groups
	- Builders : (각종 Controller 및 Grafana, Argo CD 배포)
	- Workers : (대고객 서비스 POD배포)

### Terraform Apply
먼저 _terraform.auto.tfvars 파일에서 VPC 값을 수정 합니다. **subnet_id 와 azs는  
반드시 두개 이상 넣어 주셔야 합니다.**
입력된 VPC Subnet에 EKS가 Provisioning 됩니다.  
![image](/assets/images/eks-hands-on/1.png)

아래와 같이 terraform 명령어를 실행하세요.
~~~
# terraform init 명령어를 사용해 terraform을 초기화 합니다.
cd terraform
terraform init

# 초기화가 완료되면 terraform apply 명령으로 aws 리소스를 생성합니다.
terraform apply

# 약 10분 정도 소요 됩니다.
~~~

자세한 설명은 Thingsflow tech 블로그를 확인하세요.
[tech.blog](https://techblog.thingsflow.com/tech/review/EKS_%EA%B5%AC%EC%B6%95%EA%B3%BC-CICD-%ED%8C%8C%EC%9D%B4%ED%94%84%EB%9D%BC%EC%9D%B8-%EA%B5%AC%EC%B6%95-%ED%95%B8%EC%A6%88%EC%98%A8/)
