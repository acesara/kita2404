AI기반 챗봇 및 OCR개발 전문가 과정\
m1. 데이터베이스 구축 및 활용\
m2. 파이썬 프로그래밍\
m3. 분석 라이브러리\
m4. 웹 애플리케이션 구축 프로젝트\
m5. 머신러닝\
m6. 딥러닝\
m7. NLP 응용\
m8. 자연어처리 챗봇 개발 프로젝트\
m9. VISION 응용\
m10. 최종 프로젝트
===========================================================================================================================================================================================================
20240425\
식별자 기본 규칙\
키워드를 사용하면 안된다\
특수문자는 언더바(_)만 사용\
숫자로 시작하면 안된다\
공백을 포함 할 수 없다


# 리스트 확장\

h = [1,2,3]\
h.extend([4,5]) # 반복 가능한 객체의 모든 요소를 리스트에 추가\
print(h)\
h.append(6) # 단일 객체를 추가\
print(h)\
h.insert(0,5)\
print(h)

sort 와 sorted 차이점\
메서드 vs 함수:\
sort(): 리스트 객체의 내장 메서드입니다. 즉, 리스트에서만 사용할 수 있습니다.\
sorted(): 내장 함수로, 어떤 반복 가능한(iterable) 객체에도 사용될 수 있습니다. 예를 들면 리스트, 튜플, 딕셔너리, 문자열 등에 사용할 수 있습니다.\
반환 값:\
sort(): 리스트를 원 위치에서(in-place) 정렬하고 None을 반환합니다. 따라서 원래의 리스트 자체가 변경됩니다.
sorted(): 정렬된 새로운 리스트를 반환합니다. 원래의 객체는 변경되지 않습니다.\
유용성:\
sort(): 리스트에서만 작동하기 때문에 리스트만 정렬할 수 있습니다.\
sorted(): 다양한 객체를 정렬할 수 있으며 결과는 항상 리스트로 반환됩니다.
