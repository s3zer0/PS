#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int solution(int storey) {
    int answer = 0;
    
    for(int i=0;i<10;i++){
        int val = storey % 10;
        
        if(val > 5){
            storey += (10 - val);
            answer += (10 - val);
            storey = storey / 10;
        } else if(val == 5){
            int temp = (storey / 10) % 10;
            
            if(temp >= 5){
                storey += 5;
                answer += 5;
            } 
            else {
                storey -= 5;
                answer += 5;
            }
            storey /= 10;
        }
        else{
            storey -= val;
            answer += val;
            storey /= 10;
        }
        
        
        if(storey <= 0){
            break;
        }
    }
    
    return answer;
}
