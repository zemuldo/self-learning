function i_am_last_but_i_take_1_sec(callback) {
    return setTimeout(() => {
        console.log('i was no: 5 and i take 1 second')
        callback()
    }, 1000);
}

function i_am_fourth_but_i_take_4_sec(callback) {
    return setTimeout(() => {
        console.log('i was no: 4 and i take 4 seconds')
        callback()
    }, 4000);
}

function i_am_third_but_i_take_6_sec(callback) {
    return setTimeout(() => {
        console.log('i was no: 3 and i take 6 seconds')
        callback()
    }, 6000);
}

function i_am_second_but_i_take_8_sec(callback) {
    return setTimeout(() => {
        console.log('i was no: 2 and i take 8 seconds')
        callback()
    }, 8000);
}

function i_am_first_but_i_take_10_sec(callback) {
    return setTimeout(() => {
        console.log('i was no: 1 and i take 10 seconds')
        callback()
    }, 10000);
}

function run (){
    i_am_first_but_i_take_10_sec(()=>{
        i_am_second_but_i_take_8_sec(()=>{
            i_am_second_but_i_take_8_sec(()=>{
                i_am_third_but_i_take_6_sec(()=>{
                    i_am_fourth_but_i_take_4_sec(()=>{
                        i_am_last_but_i_take_1_sec(()=>{
                            console.log("Done")
                        })
                    })
                })
            })
        })
    })
}
function run_handle_errors (){
    i_am_first_but_i_take_10_sec(()=>{
        let error_0
        if(error_0) throw Error(error_0)
        else {
            i_am_second_but_i_take_8_sec(()=>{
                let error_1
                if(error_1) throw Error(error_1)
                else{
                    i_am_second_but_i_take_8_sec(()=>{
                        let error_2
                        if(error_2) throw Error(error_2)
                        else {
                            i_am_third_but_i_take_6_sec(()=>{
                                let error_3
                                if(error_3) throw Error(error_3)
                                else {
                                    i_am_fourth_but_i_take_4_sec(()=>{
                                        let error_4
                                        if(error_4) throw Error(error_4)
                                        else {
                                            i_am_last_but_i_take_1_sec(()=>{
                                                let error_5
                                                if(error_5) throw Error(error_5)
                                                else {
                                                    console.log("Done")
                                                }
                                            })
                                        }
                                    })
                                }
                            })
                        }
                    })
                }
            })
        }
        
    })
}

run()