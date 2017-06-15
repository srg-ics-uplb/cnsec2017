;Save as hello_asm.asm
            extern      printf       
            section     .data        
msg:        db          "Hello world", 0    
fmt:        db          "%s", 10, 0          
            section     .text        
            global      main     
main:                
            push        rbp      
            mov         rdi,fmt
            mov         rsi,msg
            mov         rax,0        
            call        printf       
            mov         rbx,7
mov         rdx,8
            pop         rbp      
            mov         rax,0        
            ret

